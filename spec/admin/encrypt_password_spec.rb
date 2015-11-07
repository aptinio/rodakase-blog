RSpec.describe Admin::EncryptPassword do
  subject(:encrypt_password) { Admin::EncryptPassword.new }

  describe '#call' do
    it 'returns an encrypted string' do
      hash = encrypt_password.('foo')

      expect(hash).to_not eql('foo')
      expect(hash.size).to be(60)
    end
  end
end
