require './listing.rb'
require './craigslist_query.rb'
require './database.rb'
require 'mail'

module EmailManager

  def self.create(array)   # Get array from Craigslist_query
  @craigslist_array = array
  #@database_array = DatabaseInterface.read
  @body = "Hi, I'm really interested in your listing."
   # process_emails
  end

  def self.process_emails
    @craigslist_array.each do |listing|
      listing.sent!
      if DatabaseInterface.write(listing) != :fail
        EmailManager.send(listing, @body)
      end
    end
  end #end process_emails

  def self.send(listing, body)
    from_email = "dbctestingemail@gmail.com"
    from_name = "DBC"

    Mail.defaults do
      delivery_method :sendmail
    end

    mail = Mail.new do
         from   from_email
           to   "felixtsai@yahoo.com"
      subject   "Interested in #{listing.title}"
         body   body
    end
    if mail.deliver
      return :success
    end

  end


end

