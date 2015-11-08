require 'blog/import'
require 'blog/view'

module Ui
  module Admin
    class Index < Blog::View::Admin
      include Blog::Import('persistence.repositories.posts')

      configure do |config|
        config.template = 'admin/posts'
      end

      def locals
        { posts: posts.index }
      end
    end
  end
end
