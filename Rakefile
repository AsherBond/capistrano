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

task :default => :spec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
>>>>>>> 8f436569fbbf55b246a385a1514f8bca85b28e13
