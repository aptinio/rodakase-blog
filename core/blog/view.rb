require 'rodakase/view'
require 'blog/container'

module Blog
  class View < Rodakase::View::Layout
    setting :root, Container.root.join('templates')
    setting :engine, :slim
    setting :name, 'app'

    class Admin < View
      setting :name, 'admin'
    end
  end
end
