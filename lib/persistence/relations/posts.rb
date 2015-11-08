module Persistence
  module Relations
    class Posts < ROM::Relation[:sql]
      dataset :posts
      register_as :posts

      def by_id(id)
        where(id: id)
      end
    end
  end
end
