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
        Dir[container.root.join("lib/persistence/#{type}/**/*.rb")]
          .each(&method(:require))
      end

      ROM.finalize.container
    end
  end

  container.auto_register!('lib/persistence/repositories') do |repo_class|
    -> { Inflecto.constantize(repo_class).new(container['persistence.rom']) }
  end

  # trigger rom boot
  #
  # TODO: we need an explicit interface for that
  container['persistence.rom']
end
