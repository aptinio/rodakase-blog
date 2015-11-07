require 'blog/import'

module Admin
  class SignIn
    include Blog::Import('admin.authenticate')

    def call(input, session)
      user = authenticate.(input)
      session[:user_id] = user
    end
  end
end
