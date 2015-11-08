Blog::Container.namespace('persistence') do |container|
  container.register('persist_user') do
    container['persistence.rom'].command(:users)[:create]
  end

  container.register('persist_post') do
    container['persistence.rom'].command(:posts)[:create]
  end
end
