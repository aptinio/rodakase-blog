require 'boot/rom'

module Helpers
  module_function

  def fixtures_path
    SPEC_ROOT.join('fixtures')
  end

  def container
    Blog::Container
  end

  def app
    Blog::Application.app
  end

  def db_conn
    container['persistence.rom'].gateways[:default].connection
  end
end
