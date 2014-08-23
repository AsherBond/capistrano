<<<<<<< HEAD
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test
=======
require "bundler/gem_tasks"
require "cucumber/rake/task"
require "rspec/core/rake_task"

task :default => :spec
RSpec::Core::RakeTask.new
<<<<<<< HEAD
>>>>>>> 8f436569fbbf55b246a385a1514f8bca85b28e13
=======

Cucumber::Rake::Task.new(:features)

>>>>>>> e63eda7a0f08a1ad80ad11d5f6073aa612aae233
