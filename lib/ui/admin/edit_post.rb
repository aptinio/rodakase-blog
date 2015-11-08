require 'blog/import'
require 'blog/view'

module Ui
  module Admin
    class EditPost < Blog::View::Admin
      include Blog::Import('persistence.repositories.posts')

      configure do |config|
        config.template = 'admin/posts/edit'
      end

      def locals(params)
        { post: posts[params[:id]] }
      end
    end
  end
end
