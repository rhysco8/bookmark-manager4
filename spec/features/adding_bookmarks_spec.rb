feature 'adding bookmark' do
  scenario 'add a new bookmark' do
    visit('/bookmarks/new')
    fill_in 'url', :with => 'https://www.youtube.com'
    click_button 'submit'
    expect(page).to have_content('https://www.youtube.com')
  end
end