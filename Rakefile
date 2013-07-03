#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec
task :test => :spec

namespace :doc do
  begin
    require 'yard'
  rescue LoadError
    # ignore
  else
    YARD::Rake::YardocTask.new do |task|
      task.files   = ['lib/**/*.rb']
      task.options = [
        '--protected',
        '--output-dir', 'doc/yard',
        '--tag', 'format:Supported formats',
        '--markup', 'markdown',
      ]
    end
  end
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r citibikenyc.rb"
end