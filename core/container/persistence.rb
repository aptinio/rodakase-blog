Blog::Container.namespace('persistence') do |container|
  container.register('persist_user') do
    container['persistence.rom'].command(:users)[:create]
  end

  container.register('persist_post') do
    container['persistence.rom'].command(:posts)[:create]
  end

  container.register('update_post') do
    container['persistence.rom'].command(:posts)[:update]
  end
end
