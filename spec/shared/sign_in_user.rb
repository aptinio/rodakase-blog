RSpec.shared_context 'signed in user' do
  include_context 'user'

  background do
    visit '/admin/sign_in'

    fill_in('Email', with: user.email)
    fill_in('Password', with: 'foo')

    click_on 'Submit'
  end
end
