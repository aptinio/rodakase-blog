require 'equalizer'
require 'dry/data'

module Entities
  class Post < Dry::Data::Struct
    include Equalizer.new(:id, :title, :body, :user_id)

    attribute :id, 'int'
    attribute :title, 'string'
    attribute :body, 'string'
    attribute :user_id, 'int'

    # TODO: make view objects work with anything that responds to `[]`
    def key?(name)
      instance_variables.include?(:"@#{name}")
    end

    def [](name)
      public_send(name)
    end
  end
end
