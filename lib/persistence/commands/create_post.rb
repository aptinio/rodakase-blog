module Persistence
  module Commands
    class CreatePost < ROM::Commands::Create[:sql]
      input Dry::Data['hash'].schema(
        user_id: 'int',
        title: 'string',
        body: 'string'
      )

      relation :posts
      register_as :create
      result :one

      associates :user, key: [:user_id, :id]
    end
  end
end
