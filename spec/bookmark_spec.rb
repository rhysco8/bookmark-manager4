require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.cnn.com")
    end
  end 
end
