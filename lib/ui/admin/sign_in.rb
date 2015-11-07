require 'blog/view'

module Ui
  module Admin
    class SignIn < Blog::View::Admin
      configure do |config|
        config.template = 'admin/sign_in'
      end
    end
  end
end
