require 'rubygems'
require 'open-uri'
require 'nokogiri'
require './listing.rb'
require './craigslist_query.rb'

# url = ARGV[0] or raise ArgumentError.new("You must supply a search URL")


class Io

  def initialize
    get_craigslist_url
  end

  def get_craigslist_url
    puts "Enter the URL you'd like to crawl: "
    url = gets.chomp!
    # url = "http://sfbay.craigslist.org/search/roo/sfc?query=&srchType=A&minAsk=500&maxAsk=1050&hasPic=1"
    puts url
    puts " "
    puts "Fetching and Parsing Craigslist page..."
    @new_list = CraigslistQuery.new(url)
    display_listings
        # get_email_details
  end

  def display_listings
    @new_list.query_list.each do |query|
      # puts "%s\t%s\t%s\t%s" % [query.price, query.url, query.title, query.email]
      puts query
    end
  end
  
  def get_email_details
    print "What is the sender's email address? "
    senders_email = gets.chomp!
    print "What is the sender's name? "
    senders_name = gets.chomp!
  end

end


Io.new

