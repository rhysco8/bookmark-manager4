require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
   end

   describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end

    it "returns error message if URL is invalid'" do
      bookmark = Bookmark.create(url: 'www.testbookmark.com', title: 'Test Bookmark')

      expect(bookmark).to eq(false)
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      bookmark_id = bookmark.id

      Bookmark.delete(id: bookmark_id)
      expect(persisted_data(id: bookmark_id)).to be_nil
    end
  end

  describe '.find' do
    it 'retrieves a specified bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      expect(Bookmark.find(id: bookmark.id).id).to eq(bookmark.id)
      expect(Bookmark.find(id: bookmark.id).title).to eq(bookmark.title)
      expect(Bookmark.find(id: bookmark.id).url).to eq(bookmark.url)
    end
  end

  describe '.update' do
    it 'updates the title of a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

      Bookmark.update(id: bookmark.id, title: 'Makers Academy', url: 'http://www.makersacademy.com')

      expect(Bookmark.find(id: bookmark.id).title).not_to eq(bookmark.title)
      expect(Bookmark.find(id: bookmark.id).title).to eq('Makers Academy')
    end

    it 'updates the url of a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

      Bookmark.update(id: bookmark.id, title: 'Makers Academy', url: 'http://www.makersacademy.com')

      expect(Bookmark.find(id: bookmark.id).url).not_to eq(bookmark.url)
      expect(Bookmark.find(id: bookmark.id).url).to eq('http://www.makersacademy.com')
    end

  end

end
