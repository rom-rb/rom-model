require "rspec/core/rake_task"
require "rake/testtask"

RSpec::Core::RakeTask.new(:spec)
task default: [:ci]

desc "Run CI tasks"
task ci: [:spec]
