module Blog
  class Application < Rodakase::Application
    plugin :halt

    def current_user
      env['blog.current_user']
    end

    def set_current_user!(user)
      env['blog.current_user'] = user
    end

    route('admin') do |r|
      r.resolve(:page) do |page|
        r.on('sign_in') do
          r.is(to: 'ui.admin.sign_in', call_with: [page])
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

            r.is(to: 'ui.admin.index', call_with: [page])
          end
        end
      end
    end
  end
end
