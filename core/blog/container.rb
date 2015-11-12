require 'rodakase/container'

module Blog
  class Container < Rodakase::Container
    setting :auto_register, 'lib'

    configure do
      load_paths!('lib', 'core')
    end
  end
end
