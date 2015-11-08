require 'blog/view'

module Ui
  module Admin
    class Index < Blog::View::Admin
      configure do |config|
        config.template = 'admin/posts'
      end

      def call(page, locals = {})
        # TODO: add support for building locals hash so we don't have to override call
        super(page, locals.merge(posts: posts))
      end

      def posts
        # TODO: add support for Import to View objects
        Blog::Container['persistence.repositories.posts'].index
      end
    end
  end
end
