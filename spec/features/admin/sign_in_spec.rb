RSpec.feature 'Signin into admin panel', type: :feature do
  include_context 'user'

  scenario do
    visit '/admin/sign_in'

    expect(page).to have_content('Sign-in')

    fill_in('Email', with: 'jane@doe.org')
    fill_in('Password', with: 'foo')
    click_on('Submit')

    expect(page).to have_content('Blog - Admin Panel')
  end
end
