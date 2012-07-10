require 'simplecov'
SimpleCov.start
require 'rspec'
require './database.rb'
require './listing.rb'


describe "database class" do
  
  before :each do
    @new_database = DatabaseInterface.new
  end
  
  it "creates an instance of the database class" do
    @new_database.should be_an_instance_of DatabaseInterface
  end
  
  it "writes a listing to the database" do
    test_listing = Listing.new("Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date")
    @new_database.write(test_listing)
    @listings_db = SQLite3::Database.open( "listings.db" )
    listing_array = @listings_db.execute( "select * from listings" )
    listing_array.should be_an_instance_of Array
    # listing_array.first.first.should eq "Test Title"
    listing_array.first.should eq [1, "Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date"]
  end
  
  it "reads an array of listings from the database" do
    @listings_db = SQLite3::Database.open( "listings.db" )
    listing_array = @new_database.read
    listing_array.should be_an_instance_of Array
    listing_array.first.should be_an_instance_of Listing
    listing_array.first.title.should eq "Test Title"
    # [:title => "Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date"]
  end
  
  
end #end describe