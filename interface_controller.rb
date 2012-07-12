require 'rubygems'
require 'open-uri'
require 'nokogiri'
require './listing.rb'
require './craigslist_query.rb'
require './database.rb'

# url = ARGV[0] or raise ArgumentError.new("You must supply a search URL")


module InterfaceController

  def self.run
    get_craigslist_url
    DatabaseInterface.create
    # get_email_details
    # call DatabaseInterface.create (include if logic for checking to see if DB exists)
    # EmailManager.new(@new_list)
    # EmailManager.
    # call email manager to email listing owners
    #     - manager writes listings to DB
    display_history
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
  
  # THE SENDER'S EMAIL AND NAME IS CURRENTLY HARDCODED FOR ONE USER
  # def self.get_email_details
  #   # add logic to verify email has right format
  #   print "What is the sender's email address? "
  #   senders_email = gets.chomp!
  #   print "What is the sender's name? "
  #   senders_name = gets.chomp!
  # end

  def self.display_history
    puts "Here's the history of emails sent:"
    listings = DatabaseInterface.read
    listings.each do |listing|
      puts listing.to_string
    end
  end


end


InterfaceController.run



