require 'blog/import'
require 'entities/post'
require 'transproc'

module Admin
  class CreatePost
    include Blog::Import('persistence.persist_post')

    extend Transproc::Registry

    import Transproc::HashTransformations

    def call(params, user)
      attributes = persist_post.with(prepare_attributes(params)).(id: user.id)
      Entities::Post.new(attributes)
    end

    def prepare_attributes(params)
      transformer[params]
    end

    def transformer
      self.class[:symbolize_keys] >> self.class[:accept_keys, [:title, :body]]
    end
  end
end
