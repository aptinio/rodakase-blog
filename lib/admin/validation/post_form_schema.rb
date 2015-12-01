require 'dry/validation/schema/form'

module Admin
  module Validation
    class PostFormSchema < Dry::Validation::Schema::Form
      key(:title) { |value| value.filled? }
      key(:body) { |value| value.filled? }
    end
  end
end
