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

    extend Transproc::Registry

    import Transproc::HashTransformations

    def call(params)
      errors = user_schema.messages(params)

      if errors.any?
        raise ArgumentError, 'user params are not valid'
      else
        Entities::User.new(persist_user.(prepare_attributes(params)))
      end
    end

    def prepare_attributes(params)
      password = params.fetch(:password)
      transformer[params].merge(encrypted_password: encrypt_password.(password))
    end

    def transformer
      self.class[:accept_keys, [:name, :email]]
    end
  end
end
