require 'blog/import'

module Admin
  class Authenticate
    include Blog::Import('admin.encrypt_password', 'persistence.repositories.users')

    def call(attributes)
      email, password = attributes['user'].values_at('email', 'password')
      user = users.by_email(email)

      if user && encrypt_password.same?(user.encrypted_password, password)
        user
      end
    end
  end
end
