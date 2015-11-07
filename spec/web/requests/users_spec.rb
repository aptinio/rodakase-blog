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
end
