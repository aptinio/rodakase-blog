require 'db_helper'
require 'admin/create_user'

RSpec.describe Admin::CreateUser do
  subject(:create_user) { Admin::CreateUser.new(encrypt_password) }

  let(:encrypt_password) { instance_double(Admin::EncryptPassword) }

  it 'creates a user with encrypted password' do
    expect(encrypt_password).to receive(:call).with('foo').and_return('foo-encrypted')

    input = { name: 'Jane', email: 'jane@doe.org', password: 'foo' }

    user = create_user.(input)

    expect(user.name).to eql(input[:name])
    expect(user.email).to eql(input[:email])
    expect(user.encrypted_password).to eql('foo-encrypted')
  end

  it 'raises error when params are not valid' do
    expect { create_user.(name: '') }.to raise_error(ArgumentError)
  end
end
