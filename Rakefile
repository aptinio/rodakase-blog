require 'bundler'

Bundler.setup

require_relative 'core/blog/container'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: [:spec]

require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    env = ENV.fetch('RACK_ENV', :development).to_sym
    Blog::Container.configure(env) { |c| c }
    Blog::Container['persistence.setup']
  end
end
