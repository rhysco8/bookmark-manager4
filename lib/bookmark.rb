require 'pg'

class Bookmark

  def self.all
    db = PG.connect :dbname => 'bookmark_manager'
    all = db.exec "SELECT * FROM bookmarks"

    all.map do |row|
      row['url']    
    end
  end 
end
