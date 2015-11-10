require 'logger'
require 'rodakase/view'

require_relative 'blog/container'

Blog::Container.configure do |container|
  container.register(:logger, Logger.new(container.root.join('log/app.log')))
end

require 'blog/application'
require 'blog/view'
