require './listing.rb'
require 'rubygems'
require 'mail'

module EmailSender

  def self.send(array, body)
    all_listings = array
    body = body
    from_email = "lachy@devbootcamp.com"
    from_name = "Lachy Groom"

    Mail.defaults do
      delivery_method :sendmail
    end

    mail = Mail.new do
      from from_email
      to email
    subject 'interested in #{title}'
      body body
    end
    mail.deliver
    puts mail.to_s


  end




end
