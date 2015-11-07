require 'rodakase/application'
require_relative 'container'

module Blog
  class Application < Rodakase::Application
    setting :container, Container

    use Rack::Session::Cookie, key: 'rack.session',
      domain: 'localhost',
      path: '/',
      expire_after: 2592000,
      secret: 'TODO'

    route do |r|
      r.multi_route
    end

    load_routes!
  end
end
