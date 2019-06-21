feature 'adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'users inputs invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_content("Invalid URL")
    expect(page).not_to have_link('Test Bookmark', href: 'www.testbookmark.com')

  end
end
