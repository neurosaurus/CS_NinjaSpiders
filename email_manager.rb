require './listing.rb'
require './craigslist_query.rb'
require './email_sender.rb'

class EmailManager


  attr_reader :craigslist_array

  def initialize(array)   # Get array from Craigslist_query
    @craigslist_array = array
    # process_emails
  end

#  def process_emails
# database_array = DatabaseInterface.read
# Go through each listing in the array and
# check against the database if listing is a duplicate.
  # duplicate is defined as a duplicate URL
  # don't send an email if the listing is in the DB and
  # is less than 3 days old



  # IGNORE THIS EDGE CASE FOR NOW
  # if there is a listing from an owner that has already recieved an email,
  # send the alternate email.


  # if no duplicate
    # EmailSender.send
    # DatabaseInterface.write(listing)
    # mark listing as sent
    #write into database (send)
  #else
    #don'tsend
  #display to user what has been sent




end

