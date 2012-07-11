class Listing

  attr_reader :title, :url, :email, :price, :sent_at

  def initialize(title, url, email, price, sent_at = nil)
    @title        = title
    @url          = url
    @email        = email
    @price        = price
    @sent_at      = sent_at
  end

  def to_string
   "#{@title} ; #{@url} ; #{@email} ; #{@price} ; #{@sent_at}"
  end

  def sent!
    @sent_at = Time.now
  end

end