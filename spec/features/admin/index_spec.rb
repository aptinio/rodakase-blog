RSpec.feature 'Browsing admin post index' do
  include_context 'signed in user'
  include_context 'posts'

  scenario do
    visit '/admin'

    expect(page).to have_content('Post One')
    expect(page).to have_content('Post Two')
  end
end
