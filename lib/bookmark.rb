require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      db = PG.connect :dbname => 'bookmark_manager_test'
    else  
      db = PG.connect :dbname => 'bookmark_manager'
    end
    
    all = db.exec "SELECT * FROM bookmarks"
    all.map do |row|
      row['url']    
    end
  end 
end
