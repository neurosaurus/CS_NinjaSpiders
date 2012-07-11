require 'simplecov'
SimpleCov.start
require 'rspec'
require './listing.rb'
require './email_manager.rb'

describe "email manager" do

  before :each do
    new_array = []
    new_array << Listing.new("2br/2bath", "url", "felixtsai@yahoo.com", "hi")
    @new_email_manager = EmailManager.new(new_array)

  end

  it "should create an email manager object" do
    @new_email_manager.should be_an_instance_of EmailManager
  end

  it "should take in an array of Listing objects" do
    @new_email_manager.craigslist_array.should be_an_instance_of Array
  end

end

describe "#database array" do

  it "should receive from Database an array of listings" do
    @new_email_manager.database_array.should be_an_instance_of Array
  end

  it "should contain an array of Listing objects" do
    @new_email_manager.database_array[-1].should be_an_instance_of Listing
  end

end #end describe
