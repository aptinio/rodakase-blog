require 'logger'
require 'rodakase/view'

require_relative 'blog/application'
require_relative 'blog/view'
require_relative 'blog/page'

Blog::Container.configure do |container|
  container.register(:logger, Logger.new(container.root.join('log/app.log')))
  container.register(:renderer, Rodakase::View::Renderer.new(container.root.join('templates')))
  container.register(:page, Blog::Page.new(container.config))
end

Blog::Container.finalize!
