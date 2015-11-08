require 'blog/import'
require 'blog/view'

module Ui
  module Admin
    class Index < Blog::View::Admin
      include Blog::Import('persistence.repositories.posts')

      configure do |config|
        config.template = 'admin/posts'
      end

      def call(page, locals = {})
        # TODO: add support for building locals hash so we don't have to override call
        super(page, locals.merge(posts: posts.index))
      end
    end
  end
end
