# encoding: utf-8

begin
  require 'byebug'
rescue LoadError; end

require 'rack/test'
require 'slim'

ENV['RACK_ENV'] = 'test'

SPEC_ROOT = Pathname(__FILE__).dirname

Dir[SPEC_ROOT.join('support/*.rb').to_s].each { |f| require f }
Dir[SPEC_ROOT.join('shared/*.rb').to_s].each { |f| require f }

require SPEC_ROOT.join('../core/boot').realpath.to_s

require 'capybara/rspec'

Capybara.app = Blog::Application.app
Capybara.app_host = 'http://localhost'

require 'database_cleaner'
DatabaseCleaner[:sequel, connection: Helpers.db_conn].strategy = :truncation

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    Blog::Application.freeze
  end

  config.include Rack::Test::Methods, type: :request
  config.include Rack::Test::Methods, Capybara::DSL, type: :feature
  config.include Helpers

  config.around do |e|
    DatabaseCleaner.cleaning { e.run }
  end
end
