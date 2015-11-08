require 'entities/post'

module Persistence
  module Repositories
    class Posts < ROM::Repository
      relations :posts

      def [](id)
        posts.where(id: id).as(Entities::Post).one
      end

      def index
        posts.as(Entities::Post).to_a
      end
    end
  end
end
