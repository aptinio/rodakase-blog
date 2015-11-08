shared_context 'posts' do
  before do
    [{ title: 'Post One', body: 'Text One' }, { title: 'Post Two', body: 'Text Two' }].each do |attributes|
      container['admin.create_post'].(attributes, user)
    end
  end
end
