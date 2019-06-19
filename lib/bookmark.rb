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

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
  
end
