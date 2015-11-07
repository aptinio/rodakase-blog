module Blog
  class Application < Rodakase::Application
    route('users') do |r|
      r.resolve(:page) do |page|
        r.get(to: 'ui.users.hello', call_with: [page])
      end
    end
  end
end
