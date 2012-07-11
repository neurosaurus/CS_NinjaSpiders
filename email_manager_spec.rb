require 'simplecov'
SimpleCov.start
require 'rspec'
require './listing.rb'
require './email_manager.rb'

describe "email manager" do

  before :each do
    @new_email_manager = EmailManager.new
  end

  it "should create an email manager object" do
    @new_email_manager.should be_an_instance_of EmailManager
  end

end #end describe
