require 'app_helper'

RSpec.feature 'Browsing admin post index' do
  include_context 'signed in user'
  include_context 'posts'

  scenario 'post list' do
    visit '/admin'

    expect(page).to have_content('Post One')
    expect(page).to have_content('Post Two')
  end

  scenario 'adding a new post' do
    visit '/admin'

    click_on 'New Post'

    fill_in('Title', with: 'Hello World')
    fill_in('Body', with: 'This is a post!')

    click_on('Submit')

    within('.posts') do
      expect(page).to have_content('Hello World')
    end
  end

  scenario 'editing a post' do
    visit '/admin'

    within('.posts') do
      first('a', text: 'Edit').click
    end

    expect(page).to have_content('Edit Post')

    fill_in('Title', with: 'Post One Updated')
    click_on 'Submit'

    within('.posts') do
      expect(page).to have_content('Post One Updated')
    end
  end
end
