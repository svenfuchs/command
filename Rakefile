require 'rake/testtask'

require File.expand_path("../lib/command/version", __FILE__)

task :default => [:test]

Rake::TestTask.new(:test) do |t|
  t.pattern = "#{File.dirname(__FILE__)}/test/**/*_test.rb"
  t.verbose = true
end
Rake::Task['test'].comment = "Run all tests"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "command"
    s.version = Command::VERSION
    s.summary = "Distributed command processing dsl"
    s.email = "svenfuchs@artweb-design.de"
    s.homepage = "http://github.com/svenfuchs/command"
    s.description = "Distributed command processing dsl. Only implemented interface currently is Twitter."
    s.authors = ['Sven Fuchs']
    s.files =  FileList["[A-Z]*", "{lib,test}/**/*"]
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
