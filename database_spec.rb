require 'simplecov'
SimpleCov.start
require 'rspec'
require './database.rb'
require './listing.rb'


describe "database class" do

  before :each do
    DatabaseInterface.create
    @test_listing = Listing.new("Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date")
  end

  it "writes a listing to the database" do
    DatabaseInterface.write(@test_listing)
    @listings_db = SQLite3::Database.open( "listings.db" )
    listing_array = @listings_db.execute( "select * from listings" )
    listing_array.should be_an_instance_of Array
    # listing_array.first.first.should eq "Test Title"
    listing_array.first[1..-1].should eq ["Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date"]
  end

  it "reads an array of listings from the database" do
    @listings_db = SQLite3::Database.open( "listings.db" )
    listing_array = DatabaseInterface.read
    listing_array.should be_an_instance_of Array
    listing_array.first.should be_an_instance_of Listing
    listing_array.first.title.should eq "Test Title"
    # [:title => "Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", "email_date"]
  end

  it "should delete listings from the database" do
    DatabaseInterface.delete(@test_listing)
    @listings_db = SQLite3::Database.open( "listings.db" )
    listing_array = DatabaseInterface.read
    listing_array.first.title.should == nil
  end


end #end describe