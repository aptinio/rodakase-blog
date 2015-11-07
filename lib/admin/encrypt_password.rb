require 'bcrypt'

module Admin
  class EncryptPassword
    include BCrypt

    def call(input)
      Password.create(input)
    end
  end
end
