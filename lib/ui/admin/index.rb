require 'blog/view'

module Ui
  module Admin
    class Index < Blog::View::Admin
      configure do |config|
        config.template = 'admin/index'
      end
    end
  end
end
