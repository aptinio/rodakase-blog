require 'blog/view'

module Ui
  module Users
    class Hello < Blog::View
      configure do |config|
        config.template = 'users/hello'
      end
    end
  end
end
