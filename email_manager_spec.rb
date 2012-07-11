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

  it ""

end #end describe
