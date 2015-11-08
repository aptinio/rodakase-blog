require 'admin/create_post'

RSpec.describe Admin::CreatePost do
  subject(:create_post) { Admin::CreatePost.new }

  include_context 'user'

  it 'creates a post' do
    input = {
      title: 'Hello World',
      body: 'Minions ipsum baboiii tank yuuu! Tank yuuu! Hahaha.'
    }

    post = create_post.(input, user)

    expect(post.title).to eql(input[:title])
    expect(post.body).to eql(input[:body])
    expect(post.user_id).to be(user.id)
  end
end
