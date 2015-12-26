require 'rodakase/container'

module Blog
  class Container < Rodakase::Container
    configure do |config|
      config.name = :application
      config.auto_register = 'lib'
    end

    load_paths!('lib', 'core')
  end
end
