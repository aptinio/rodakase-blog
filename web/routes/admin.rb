module Blog
  class Application < Rodakase::Application
    plugin :halt

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
