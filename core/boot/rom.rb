require 'rom'
require 'rom-repository'

Blog::Container.namespace('persistence') do |container|
  container.register('setup') do
    ROM.use(:auto_registration)
    ROM.setup(:sql, container.config.app.database_url)
  end

  container.register('rom') do
    if ROM.container
      ROM.container
    else
      container['persistence.setup']

      %w(relations commands).each do |type|
        container.require("lib/persistence/#{type}/**/*.rb")
      end

      ROM.finalize.container
    end
  end

  container.auto_register!('lib/persistence/repositories') do |repo|
    -> { repo.new(container['persistence.rom']) }
  end

  container.require('core/container/persistence')
end
