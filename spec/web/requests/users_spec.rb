require 'entities/user'

RSpec.describe '/users', type: :request do
  describe 'GET' do
    it 'renders hello template' do
      get '/users'

      expect(last_response).to be_ok
      expect(last_response.body).to eql(
        '<!DOCTYPE html><html><head><title>Blog</title></head><body><h1>Hello World</h1></body></html>'
      )
    end
  end

  describe 'POST' do
    it 'creates a user' do
      user = { id: '1', name: 'Jane' }

      post '/users', user: user

      expect(last_response).to be_created

      expect(container['persistence.repositories.users'].all).to eql([Entities::User.new(id: 1, name: 'Jane')])
    end
  end
end
