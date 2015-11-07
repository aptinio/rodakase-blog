RSpec.describe '/admin/sessions', type: :request do
  describe 'POST' do
    include_context 'user'

    it 'signs in the user when password is valid' do
      post '/admin/sessions', user: { email: user.email, password: 'foo' }

      expect(last_response).to be_redirect
    end

    it 'does not sign in the user when password is not valid' do
      post '/admin/sessions', user: { email: user.email, password: 'bar' }

      expect(last_response).to be_unauthorized
    end

    it 'does not sign in the user when email is not valid' do
      post '/admin/sessions', user: { email: 'bar', password: 'foo' }

      expect(last_response).to be_unauthorized
    end
  end
end
