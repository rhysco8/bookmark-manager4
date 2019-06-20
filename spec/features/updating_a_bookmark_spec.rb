feature 'updating bookmarks' do
  scenario 'a user updats a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')
    click_button('Update')

    expect(page).to have_content('Makers Academy', 'http://www.makersacademy.com')

    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Update')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
