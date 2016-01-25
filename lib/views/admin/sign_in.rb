require 'blog/view'

module Views
  module Admin
    class SignIn < Blog::View::Admin
      configure do |config|
        config.template = 'admin/sign_in'
      end
    end
  end
end
