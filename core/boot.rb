require 'logger'
require 'rodakase/renderer'

require_relative 'blog/application'

Blog::Container.configure do |container|
  container.register(:logger) do
    Logger.new(container.root.join('log/app.log'))
  end

  container.register(:renderer) do
    Rodakase::Renderer.new(container.root.join('templates'))
  end
end

Blog::Container.finalize!
