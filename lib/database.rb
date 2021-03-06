require 'sqlite3'
require_relative 'listing.rb'

class DatabaseInterface

  def self.create(file_path)
    @file_path = file_path
    listings_db = SQLite3::Database.new(@file_path)
    listings_db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS listings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(128) NOT NULL,
        url VARCHAR(128) NOT NULL,
        email VARCHAR(64) NOT NULL,
        price VARCHAR(64) NULL,
        sent_at DATETIME NOT NULL,
        UNIQUE (url)
      );
    SQL
    # load_from_db
  end

  DatabaseInterface.read
  Listing.all
  Listing.find_by_email('......')

  def self.read
    listings = []
    listings_db = SQLite3::Database.open(@file_path)
    temp_listings = listings_db.execute( "select * from listings order by sent_at desc" )
    temp_listings.map do |listing_array|
      Listing.new(listing_array[1], listing_array[2], listing_array[3], listing_array[4], listing_array[5])
    end
  end #end read


  def self.write(listing)
    listings_db = SQLite3::Database.open(@file_path)
    begin
    sql = <<-SQL
      INSERT INTO listings (title, url, email, price, sent_at)
      VALUES (?, ?, ?, ?, ?)
    SQL

    listings_db.execute(sql, listing.title, listing.url, listing.email, listing.price, listing.sent_at)

    rescue SQLite3::ConstraintException
      return :fail
    end
 end #end write

end #end Database


DatabaseInterface.write(listing)
