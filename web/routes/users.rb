module Blog
  class Application < Rodakase::Application
    route('users') do |r|
      r.resolve(:page) do |page|
        r.get(to: 'ui.users.hello', call_with: [page])

        r.resolve('persistence.commands.create_user') do |create_user|
          r.post do
            create_user.(r.params['user'])

            response.status = 201
          end
        end
      end
    end
  end
end
