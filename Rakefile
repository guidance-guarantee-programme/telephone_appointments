require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

default_tasks = [:spec]

begin
  # Rubocop is not available in envs other than development and test.
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
  default_tasks << :rubocop
rescue LoadError
end

task default: default_tasks
