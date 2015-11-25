require 'dry-validation'

module Admin
  module Validation
    class UserSchema < Dry::Validation::Schema
      key(:name) { |value| value.filled? }
      key(:email) { |value| value.filled? }
      key(:password) { |value| value.filled? }
    end
  end
end
