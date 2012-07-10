require './listing.rb'

describe "Listing - " do

  before(:each) do
    @a_designated_time = Time.now
    @listing = Listing.new("2Br in the Mission. Going Fast. Call NOW!!", "www.craigslist.com/SDBF@84b12b4bjkbt146812h", "h41034t1304nviu348@craigslist.com","$440",@a_designated_time)
  end

  describe "initialize" do

    it "is an instance of the Listing class" do
      @listing.should be_an_instance_of Listing
    end

    it "should initialize with a title" do
      @listing.title.should eq("2Br in the Mission. Going Fast. Call NOW!!")
    end

    it "should initialize with a price" do
      @listing.price.should eq("$440")
    end

    it "should initialize with a url" do
      @listing.url.should eq("www.craigslist.com/SDBF@84b12b4bjkbt146812h")
    end

    it "should initialize with an email" do
      @listing.email.should eq("h41034t1304nviu348@craigslist.com")
    end

    it "should initialize with what time it was sent at" do
      @listing.sent_at.should eq(@a_designated_time)
    end

  end

  describe "displays listing as a string" do

    it "displays the listing as a string object" do
      @listing.to_s.should eq("2Br in the Mission. Going Fast. Call NOW!! ; www.craigslist.com/SDBF@84b12b4bjkbt146812h ; h41034t1304nviu348@craigslist.com ; $440 ; #{@a_designated_time}" )
    end
  end

  describe "handling email status" do

    it "marks listing as sent via email" do
      @listing = Listing.new("2Br in the Mission. Going Fast. Call NOW!!", "www.craigslist.com/SDBF@84b12b4bjkbt146812h", "h41034t1304nviu348@craigslist.com","$440")
      @listing.sent_at.should eq(nil)
      @listing.sent!
      @listing.sent_at.should_not eq(nil)
    end
  end

end