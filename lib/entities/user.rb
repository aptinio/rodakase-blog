require 'equalizer'
require 'dry/data'

module Entities
  class User < Dry::Data::Struct
    include Equalizer.new(:id, :name, :email, :encrypted_password)

    attribute :id, 'int'
    attribute :name, 'string'
    attribute :email, 'string'
    attribute :encrypted_password, 'string'
  end
end
