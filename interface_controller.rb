require 'rubygems'
require 'open-uri'
require 'nokogiri'
require './listing.rb'
require './craigslist_query.rb'
require './database.rb'
require './email_manager.rb'

module InterfaceController

  def self.run
    new_list = CraigslistQuery.new(get_craigslist_url)
    DatabaseInterface.create
    email_manager = EmailManager.new(new_list.query_list)
    email_manager.process_emails
    display_history
    # WHILE LOOP get other commands (ie "history", "new query", "quit")
  end


  def self.get_craigslist_url
    puts "Enter the URL you'd like to crawl: "
    url = gets.chomp!
    puts " "
    puts "Fetching and Parsing Craigslist page..."
    return url
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



