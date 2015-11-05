require 'blog/import'

module Ui
  module Users
    class Hello
      include Blog::Import(:renderer)

      def call
        renderer.call('users/hello.slim')
      end
    end
  end
end
