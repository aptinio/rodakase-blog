require 'blog/import'

module Admin
  class Authorize
    include Blog::Import('persistence.repositories.users')

    def call(session, &block)
      user_id = session[:user_id]

      if user_id
        yield(users[user_id])
      else
        yield(nil) # ugh
      end
    end
  end
end
