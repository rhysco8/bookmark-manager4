require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a new connection' do
      allow(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it "passes a query string to SQL" do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      allow(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
