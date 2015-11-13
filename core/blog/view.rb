require_relative 'container'

require 'rodakase/view'
require 'blog/page'

module Blog
  Container.register(:page, Page.new(Container.config))

  class View < Rodakase::View::Layout
    setting :root, Container.root.join('web/templates')
    setting :scope, Container[:page]
    setting :engine, :slim
    setting :name, 'app'

    class Admin < View
      setting :name, 'admin'
    end
  end
end
