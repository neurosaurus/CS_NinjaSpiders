require 'rubygems'
require 'open-uri'
require 'nokogiri'
require './listing.rb'
require './craigslist_query.rb'

# url = ARGV[0] or raise ArgumentError.new("You must supply a search URL")


module InterfaceController

  def self.run
    get_craigslist_url
    get_email_details
    # EmailManager.new(@new_list)
    # EmailManager.
    # call email manager to email listing owners
    #     - manager writes listings to DB
    display_listings
    # WHILE LOOP get other commands (ie "history", "new query", "quit")
  end


  def self.get_craigslist_url
    puts "Enter the URL you'd like to crawl: "
    url = gets.chomp!
    # url = "http://sfbay.craigslist.org/search/roo/sfc?query=&srchType=A&minAsk=500&maxAsk=1050&hasPic=1"
    puts " "
    puts "Fetching and Parsing Craigslist page..."
    @new_list = CraigslistQuery.new(url)
  end


  def self.display_listings
    # THE LISTINGS WILL EITHER BE EMAILED THE INITIAL EMAIL OR THE SECONDARY EMAIL
    @new_list.query_list.each do |query|
      puts "%s\t%s\t%s\t%s" % [query.price, query.url, query.title, query.email]
      # puts query.class
      # puts query
    end
  end

  def self.history
  end


  def self.get_email_details
    # add logic to verify email has right format
    print "What is the sender's email address? "
    senders_email = gets.chomp!
    print "What is the sender's name? "
    senders_name = gets.chomp!
  end

end


InterfaceController.run



