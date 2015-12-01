module Persistence
  module Commands
    class CreateUser < ROM::Commands::Create[:sql]
      input Dry::Data['hash'].schema(
        email: 'string', name: 'string', encrypted_password: 'string'
      )

      relation :users
      register_as :create
      result :one
    end
  end
end
