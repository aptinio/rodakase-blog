require 'blog/import'
require 'entities/user'
require 'transproc'

module Admin
  class CreateUser
    include Blog::Import(
      'admin.encrypt_password',
      'admin.validation.user_schema',
      'persistence.persist_user'
    )

    def call(params)
      result = user_schema.(params)

      if result.errors.any?
        raise ArgumentError, 'user params are not valid'
      else
        Entities::User.new(persist_user.(prepare_attributes(result.params)))
      end
    end

    def prepare_attributes(params)
      params.merge(encrypted_password: encrypt_password.(params[:password]))
    end
  end
end
