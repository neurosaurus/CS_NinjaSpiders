require 'rspec'
require './email_sender.rb'
require 'mail'


describe "email sender" do
  before(:each) do
    @email_sender = EmailSender.send([Listing.new("title","url","email","somethingelse"),
                                     Listing.new("title2","url2","email2","somethingelse2")], "Hi email, I'm interested in title. Let's talk." )
  end

  describe "initialize" do
    it "takes an array of Listing Objects" do
      @email_sender.all_listings[0].should be_an_instance_of Listing
      @email_sender.all_listings[1].should be_an_instance_of Listing
    end
  end

  describe "email body" do
    it "contains an email body" do
      @email_sender.body.should == "Hi email, I'm interested in title. Let's talk."
    end
  end
end


