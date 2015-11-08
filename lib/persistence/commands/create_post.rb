module Persistence
  module Commands
    class CreatePost < ROM::Commands::Create[:sql]
      relation :posts
      register_as :create
      result :one

      associates :user, key: [:user_id, :id]
    end
  end
end
