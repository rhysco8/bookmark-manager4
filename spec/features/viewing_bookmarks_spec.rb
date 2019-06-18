
feature 'Visiting homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit ('/bookmarks')

    expect(page).to have_content "https://google.com"
    expect(page).to have_content "https://google.com"
    expect(page).to have_content "https://cnn.com"
  end
end
