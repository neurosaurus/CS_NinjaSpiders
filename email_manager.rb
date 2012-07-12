require './listing.rb'
require './craigslist_query.rb'
require './email_sender.rb'
require './database.rb'

class EmailManager


  attr_reader :craigslist_array, :database_array

  def initialize(array)   # Get array from Craigslist_query
    @craigslist_array = array
    @database_array = DatabaseInterface.read
    @body = "Hi, I'm really interested in your listing."
    # process_emails
  end

  def process_emails
    @craigslist_array.each do |listing|
      if DatabaseInterface.write(listing) != :fail
        EmailSender.send(listing, @body)
      end
    end
  end #end process_emails

end

