module Blog
  class Application < Rodakase::Application
    plugin :halt, :symbol_matchers

    plugin :assets, css: resolve(:page).assets.stylesheets

    def current_user
      env['blog.current_user']
    end

    def set_current_user!(user)
      env['blog.current_user'] = user
    end

    route('admin') do |r|
      r.on('sign_in') do
        r.is(to: 'ui.admin.sign_in')
      end

      r.on('sessions') do
        r.post do
          r.resolve('admin.sign_in') do |sign_in|
            if sign_in.(r.params, session)
              r.redirect('/admin')
            else
              r.redirect('/admin/sign_in')
            end
          end
        end
      end

      r.resolve('admin.authorize') do |authorize|
        authorize.(session) do |user|
          if user
            set_current_user!(user)
          else
            r.redirect('/admin/sign_in')
          end

          r.on('posts') do
            r.on('new') do
              r.is(to: 'ui.admin.new_post')
            end

            r.on(:id) do |id|
              r.post do
                r.resolve('admin.update_post') do |update_post|
                  update_post.(id, r[:post])
                  r.redirect('/admin')
                end
              end

              r.on('edit') do
                r.is(to: 'ui.admin.edit_post', call_with: [id: id])
              end
            end

            r.post do
              r.resolve('admin.create_post') do |create_post|
                create_post.(r[:post], current_user)
                r.redirect('/admin')
              end
            end
          end

          r.is(to: 'ui.admin.index')
        end
      end
    end
  end
end
