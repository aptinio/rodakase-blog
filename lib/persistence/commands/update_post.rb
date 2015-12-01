module Persistence
  module Commands
    class UpdatePost < ROM::Commands::Update[:sql]
      input Dry::Data['hash'].schema(
        title: 'string',
        body: 'string'
      )

      relation :posts
      register_as :update
      result :one
    end
  end
end
