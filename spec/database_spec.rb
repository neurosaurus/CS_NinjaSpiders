require 'simplecov'
SimpleCov.start
require 'rspec'
require_relative '../lib/database.rb'
require_relative '../lib/listing.rb'


describe "database class" do

  before :each do
    DatabaseInterface.create("test_listings.db")
    Time.stub(:now).and_return("2012-07-12 10:59:53 -0700")
    @time_date = Time.now
    @test_listing = Listing.new("Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", @time_date)
    @test_listing2 = Listing.new("Test Title", "http://www.craigslist.org/2", "nomail@gmail.com", "600", @time_date)
    @test_listing3 = Listing.new("Test Title2", "http://www.craigslist.org/", "nomail@gmail.com", "600", @time_date)
    DatabaseInterface.write(@test_listing)
  end

  after :each do
    File.delete("test_listings.db")
  end

  it "should take an argument for the create" do
    expect {
      DatabaseInterface.create("test_listings.db")
    }.should_not raise_error(ArgumentError)
  end

  it "writes a listing to the database" do
    @listings_db = SQLite3::Database.open("test_listings.db" )
    listing_array = @listings_db.execute( "select * from listings" )
    listing_array.should be_an_instance_of Array
    listing_array.first[1..-1].should eq ["Test Title", "http://www.craigslist.org/", "nomail@gmail.com", "600", @time_date.to_s]
  end

  it "does not write a duplicate listing (based on URL) to the DB" do
    @listings_db = SQLite3::Database.open("test_listings.db")
    DatabaseInterface.write(@test_listing)
    DatabaseInterface.write(@test_listing2)
    DatabaseInterface.write(@test_listing3)
    listing_array = @listings_db.execute( "select * from listings" )
    listing_array.should be_an_instance_of Array
    listing_array.length.should eq 2
  end

  it "reads an array of listings from the database" do
    @listings_db = SQLite3::Database.open( "test_listings.db" )
    listing_array = DatabaseInterface.read
    listing_array.should be_an_instance_of Array
    listing_array.first.should be_an_instance_of Listing
    listing_array.first.title.should eq "Test Title"
  end


  # it "should delete listings from the database" do
  #   @listings_db = SQLite3::Database.open( "listings.db" )
  #   listing_array = DatabaseInterface.read
  #   listing_array.first.title.should == nil
  # end


end #end describe