require 'entities/post'

module Persistence
  module Repositories
    class Posts < ROM::Repository
      relations :posts

      def index
        posts.as(Entities::Post).to_a
      end
    end
  end
end
