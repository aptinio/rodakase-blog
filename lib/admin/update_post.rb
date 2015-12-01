require 'blog/import'
require 'entities/post'
require 'transproc'

module Admin
  class UpdatePost
    include Blog::Import(
      'persistence.update_post',
      'admin.validation.post_form_schema'
    )

    def call(id, params)
      result = post_form_schema.(params)

      if result.errors.none?
        Entities::Post.new(update_post.by_id(id).(result.params))
      end
    end
  end
end
