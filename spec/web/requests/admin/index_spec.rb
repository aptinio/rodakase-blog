RSpec.describe '/admin', type: :request do
  context 'when not authorized' do
    it 'returns to sign in' do
      get '/admin'

      expect(last_response).to be_redirect
      expect(last_response.location).to eql('/admin/sign_in')
    end
  end

  context 'when authorized' do
    include_context 'authorized requests'

    it 'displays a list of posts' do
      get '/admin'

      expect(last_response).to be_ok

      expect(last_response.body).to include("Blog - Admin Panel")
    end
  end
end
