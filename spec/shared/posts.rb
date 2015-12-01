RSpec.shared_context 'posts' do
  before do
    [{ title: 'Post One', body: 'Text One' }, { title: 'Post Two', body: 'Text Two' }].each do |attributes|
      container['persistence.persist_post'].with(attributes).(id: user.id)
    end
  end
end
