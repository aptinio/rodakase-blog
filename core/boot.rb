require 'logger'
require 'rodakase/view'

require_relative 'blog/application'
require_relative 'blog/view'
require_relative 'blog/page'

env = ENV.fetch('RACK_ENV', :development).to_sym

Blog::Container.configure(env) do |container|
  container.register(:logger, Logger.new(container.root.join('log/app.log')))
  container.register(:renderer, -> engine { Rodakase::View::Renderer.new(container.root.join('templates'), engine) })
  container.register(:page, Blog::Page.new(container.config))
end

# trigger rom boot
#
# TODO: we need an explicit interface for that
Blog::Container['persistence.rom']

Blog::Container.finalize!
