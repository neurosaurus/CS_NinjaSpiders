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
           to   "felixtsai@yahoo.com"
      subject   "Interested in #{listing.title}"
         body   body
    end
    if mail.deliver
      return :success
    end

  end

end

