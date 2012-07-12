require 'simplecov'
SimpleCov.start
require 'rspec'
require_relative '../lib/craigslist_query.rb'

describe "CraigslistQuery class" do
#  craigslist_query crawling a craigslist page for listing info
  before :each do
    @new_query = CraigslistQuery.new("http://sfbay.craigslist.org/search/roo/sfc?query=&srchType=A&minAsk=&maxAsk=1000")
  end
  
  it "creates a CraigslistQuery object" do
    @new_query.should be_an_instance_of CraigslistQuery
  end
  
  it "scrapes a craigslist page and loads into the array a url" do
    @new_query.query_list[0].url.should include "craigslist" 
  end

  it "scrapes a craigslist page and loads into an array a title" do
    @new_query.query_list[1].title.should include "$"
  end
  
  it "scrapes a craigslist page and loads into an array a price" do
    @new_query.query_list[2].price.should be_an_instance_of String
  end
  
  it "eliminates listings that have no email address" do
    # has_nil = false
    @new_query.query_list.each do |listing|
      listing.email.should_not eq ""
    #   if listing.email == nil
    #     has_nil = true
    #   end
    # end
    # has_nil.should == false
    end
  end
  
  
end

