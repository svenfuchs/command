$: << File.expand_path('../..', __FILE__)
$: << File.expand_path('../../lib', __FILE__)

require 'test/unit'
require 'rack/test'
require 'mocha'
require 'twibot'
require File.expand_path('../test_declarative', __FILE__)

require 'command'

CouchPotato::Config.database_name = "http://localhost:5984/command"

class Test::Unit::TestCase
  def teardown
    Command::Message.all.each { |message| message.delete }
  end

  def command(type, receiver, sender, text = '', source = 'twitter')
    Command.new(type, msg(12345, text, sender, receiver, source))
  end
  
  def msg(id = 12345, text = 'text', sender = 'sender', receiver = 'receiver', source = 'twitter')
    Command::Message.create :message_id  => id,
                            :text        => text,
                            :sender      => sender,
                            :receiver    => receiver,
                            :source      => source,
                            :received_at => Time.now
  end

  def twitter_status(from, message, id = '12345')
    Twitter::Status.new(:id => id, :user => twitter_sender(from), :text => message, :created_at => Time.now)
  end

  def twitter_sender(name)
    Twitter::User.new(:screen_name => name)
  end
  
  def capture_stdout
    @stdout, $stdout = $stdout, (io = StringIO.new)
    yield
    $stdout = @stdout
    io.string
  end
end
