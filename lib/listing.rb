class Listing

  attr_reader :title, :url, :email, :price, :sent_at

  def initialize(title, url, email, price, sent_at = nil)
    @title        = title
    @url          = url
    @email        = email
    @price        = price
    @sent_at      = sent_at
  end

  def to_string_display
    @sent_at = @sent_at.to_s.split(" ").first   # Clean up the date string
   "#{@sent_at}\t#{@title}\n\t\t#{@url}\t#{@email}"
  end

  def sent!
    @sent_at = Time.now
  end

end
