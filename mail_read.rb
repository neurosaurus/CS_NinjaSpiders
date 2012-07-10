require 'rubygems'
require 'mail'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'dbctestingemail@gmail.com',
                          :password   => 'mvclover',
                          :enable_ssl => true
end

emails = Mail.all
p emails