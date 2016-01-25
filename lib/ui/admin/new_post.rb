require 'blog/import'
require 'blog/view'

module Views
  module Admin
    class NewPost < Blog::View::Admin
      include Blog::Import('persistence.repositories.posts')

      configure do |config|
        config.template = 'admin/posts/new'
      end
    end
  end
end
