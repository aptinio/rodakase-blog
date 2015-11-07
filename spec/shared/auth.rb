shared_context 'user' do
  let!(:user) do
    container['admin.create_user'].(
      name: 'Jane', email: 'jane@doe.org', password: 'foo'
    )
  end
end

shared_context 'authorized requests' do
  include_context 'user'

  def get(path, params = {}, opts = {})
    super(path, params, opts.merge('rack.session' => { user_id: user.id }))
  end
end
