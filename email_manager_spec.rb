require 'simplecov'
SimpleCov.start
require 'rspec'
require './listing.rb'
require './email_manager.rb'

describe "email manager" do

  before :each do
    @new_array = []
    @new_array << Listing.new("2br/2bath", "url", "felixtsai@yahoo.com", "hi")
    @new_email_manager = EmailManager.create(@new_array)

  end #end each

  describe "#create" do

   it "should take an argument" do
     expect {
       EmailManager.create("array or something")
     }.should_not raise_error(ArgumentError)
   end

  end


  describe "#process emails" do

    it "should not send email if it is a duplicate" do
      @new_array << Listing.new("2br/2bath", "url", "jessie", "hi")
      DatabaseInterface.stub(:write).and_return(:fail)
      EmailManager.stub(:send).and_return(:something)
      EmailManager.should_not_receive(:send)
      EmailManager.process_emails
    end

    it "should send an email if it is not a duplicate" do
      @new_array << Listing.new("2br/2bath", "url", "jessie.a.young@gmail.com", "hi")
      EmailManager.stub(:send).and_return :sent
      DatabaseInterface.stub(:write).and_return :written
      EmailManager.should_receive(:send)
      EmailManager.process_emails
    end

  end #end describe process def emails

  describe "email sender" do

    before(:each) do
      @email_sender = EmailManager.send(Listing.new("title","url","email","somethingelse"), "Hi email, I'm interested in title. Let's talk." )
    end

    it "should send out an email" do
      @email_sender.should eq(:success)
    end

  end

end #end describe email manager