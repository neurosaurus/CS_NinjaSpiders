require 'simplecov'
SimpleCov.start
require 'rspec'
require 'database.rb'


describe "database class" do
  
  before :each do
    new_database = Database.new
  end
  
  it "creates an instance of the database class" do
    new_database.should be_an_instance_of Database
  end
  
  
  
end #end describe