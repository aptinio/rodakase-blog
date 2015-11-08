require 'blog/import'
require 'entities/post'
require 'transproc'

module Admin
  class UpdatePost
    include Blog::Import('persistence.update_post')

    extend Transproc::Registry

    import Transproc::HashTransformations

    def call(id, params)
      Entities::Post.new(update_post.by_id(id).(prepare_attributes(params)))
    end

    def prepare_attributes(params)
      transformer[params]
    end

    def transformer
      self.class[:symbolize_keys] >> self.class[:accept_keys, [:title, :body]]
    end
  end
end
