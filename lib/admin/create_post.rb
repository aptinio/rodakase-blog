require 'blog/import'
require 'entities/post'
require 'transproc'

module Admin
  class CreatePost
    include Blog::Import(
      'persistence.persist_post', 'admin.validation.post_form_schema'
    )

    def call(params, user)
      result = post_form_schema.(params)

      attributes = persist_post.with(result.params).(id: user.id)

      Entities::Post.new(attributes)
    end
  end
end
