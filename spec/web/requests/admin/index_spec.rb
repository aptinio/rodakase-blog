RSpec.describe '/admin', type: :request do
  context 'when not authorized' do
    it 'return 401' do
      get '/admin'

      expect(last_response).to be_unauthorized
    end
  end

  context 'when authorized' do
    include_context 'authorized requests'

    it 'displays a list of posts' do
      get '/admin'

      expect(last_response).to be_ok

      expect(last_response.body).to eql("hello Jane")
    end
  end
end
