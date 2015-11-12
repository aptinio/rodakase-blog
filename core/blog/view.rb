require_relative 'container'

require 'rodakase/view'
require 'blog/page'

module Blog
  class View < Rodakase::View::Layout
    setting :root, Container.root.join('templates')
    setting :scope, Blog::Page.new
    setting :engine, :slim
    setting :name, 'app'

    class Admin < View
      setting :name, 'admin'
    end
  end
end
