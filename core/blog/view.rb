require 'rodakase/view'

module Blog
  class View < Rodakase::View::Layout
    setting :renderer, -> { Blog::Container[:renderer] }
    setting :engine, :slim
    setting :name, 'app'
  end
end
