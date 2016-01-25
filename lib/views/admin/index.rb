require 'blog/import'
require 'blog/view'

module Views
  module Admin
    class Index < Blog::View::Admin
      include Blog::Import('persistence.repositories.posts')

      configure do |config|
        config.template = 'admin/posts'
      end

      def locals(options)
        { posts: posts.index }
      end
    end
  end
end
