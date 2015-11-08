require 'logger'
require 'rodakase/view'

env = ENV.fetch('RACK_ENV', :development).to_sym

require_relative 'blog/page'
require_relative 'blog/container'

Blog::Container.configure(env) do |container|
  container.register(:logger, Logger.new(container.root.join('log/app.log')))
  container.register(:page, Blog::Page.new(container.config))
end

require 'blog/application'
require 'blog/view'

