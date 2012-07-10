require 'rspec'
require './email.rb'

describe "Email" do

  before (:each) do
    @email = Email.new()
  end

  it "initializes the Email object" do
    @email.should be_an_instance_of Email
  end



end