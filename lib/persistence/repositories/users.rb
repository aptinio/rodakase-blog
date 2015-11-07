require 'entities/user'

module Persistence
  module Repositories
    class Users < ROM::Repository
      relations :users

      def all
        users.as(Entities::User).to_a
      end

      def by_email(email)
        users.where(email: email).as(Entities::User).first
      end
    end
  end
end
