require 'rodakase/view'

module Blog
  class View < Rodakase::View::Layout
    setting :renderer, -> engine { Blog::Container[:renderer].(engine) }
    setting :engine, :slim
    setting :name, 'app'

    class Admin < View
      setting :name, 'admin'
    end
  end
end
