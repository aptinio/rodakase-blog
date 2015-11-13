require 'rom'
require 'rom-repository'

Blog::Container.namespace('persistence') do |container|
  ROM.use(:auto_registration)
  ROM.setup(:sql, container.config.app.database_url)

  %w(relations commands).each do |type|
    container.require("lib/persistence/#{type}/**/*.rb")
  end

  container.register('rom', ROM.finalize.container)

  container.auto_register!('lib/persistence/repositories') do |repo|
    -> { repo.new(container['persistence.rom']) }
  end

  container.require('core/container/persistence')
end
