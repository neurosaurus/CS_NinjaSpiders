require 'rspec'
require './email_sender.rb'
require 'mail'


describe "email sender" do

  before(:each) do
    @email_sender = EmailSender.send(Listing.new("title","url","email","somethingelse"), "Hi email, I'm interested in title. Let's talk." )
  end

  it "should send out an email" do
    @email_sender.should eq(:success)
  end

  end


