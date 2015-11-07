require 'rodakase/view'

module Blog
  class View < Rodakase::View::Layout
    setting :renderer, -> { Blog::Container[:renderer] }
    setting :engine, :slim
    setting :name, 'app'

    class Admin < View
      setting :name, 'admin'
    end
  end
end
