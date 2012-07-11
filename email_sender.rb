require './listing.rb'
require 'rubygems'
require 'mail'

module EmailSender

  def self.send(listing, body)
    from_email = "dbctestingemail@gmail.com"
    from_name = "DBC"

    Mail.defaults do
      delivery_method :sendmail
    end

    mail = Mail.new do
         from   from_email
           to   listing.email
      subject   "Interested in #{listing.title}"
         body   body
    end
    if mail.deliver
      return :success
    end

  end

end



EmailSender.send(Listing.new("2br/2bath", "url", "felixtsai@yahoo.com", "hi"), "hi Felix")
