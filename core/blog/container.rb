require 'rodakase/container'

module Blog
  class Container < Rodakase::Container
    setting :auto_register, 'lib'

    load_paths!('lib')
  end
end
