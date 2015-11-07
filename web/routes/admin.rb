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
      r.resolve('admin.authorize') do |authorize|
        authorize.(session) do |user|
          if user
            set_current_user!(user)
          else
            r.halt(401)
          end
        end

        r.get do
          "hello #{current_user.name}"
        end
      end
    end

    route('admin/sessions') do |r|
      r.post do
        r.resolve('admin.sign_in') do |sign_in|
          if sign_in.(r.params, session)
            r.redirect('/admin')
          else
            r.halt(401)
          end
        end
      end
    end
  end
end
