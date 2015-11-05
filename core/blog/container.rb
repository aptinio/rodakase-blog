require 'rodakase/container'

module Blog
  class Container < Rodakase::Container
    setting :root, Pathname(__FILE__).join('../..').realpath.dirname.freeze
    setting :auto_load, true

    $LOAD_PATH.unshift(root.join('lib').to_s)
    $LOAD_PATH.unshift(root.join('core').to_s)
  end
end
