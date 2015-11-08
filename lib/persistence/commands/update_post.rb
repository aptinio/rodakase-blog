module Persistence
  module Commands
    class UpdatePost < ROM::Commands::Update[:sql]
      relation :posts
      register_as :update
      result :one
    end
  end
end
