require 'rubygems'
require 'mail'



 Mail.defaults do
  delivery_method :sendmail
end

 mail = Mail.new do
      from 'otrofimo@gmail.com, gupta.tripta@gmail.com'
        to 'summer2012@devbootcamp.com'
   subject 'Re: Everyone should use the "mail" gem'
      body "Anybody interested in a breakout session  "
    end
mail.deliver
puts mail.to_s