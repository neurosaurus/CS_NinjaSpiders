require 'sqlite3'

class Listing

  attr_reader :title, :url, :email, :price, :sent_at

  def initialize(title, url, email, price, sent_at = nil)
    @title        = title
    @url          = url
    @email        = email
    @price        = price
    @owner_contacted_at      = owner_contacted_at
  end

  def to_string_display
    @sent_at = @sent_at.to_s.split(" ").first   # Clean up the date string
   "#{@sent_at}\t#{@title}\n\t\t#{@url}\t#{@email}"
  end

  def sent!
    @sent_at = Time.now
  end

  def save #will not save if there are duplicated in the database
    listings_db = SQLite3::Database.open(@file_path)
    begin
      sql = <<-SQL
        INSERT INTO listings (title, url, email, price, sent_at)
        VALUES (?, ?, ?, ?, ?)
      SQL
      listings_db.execute(sql, @title, @url, @email, @price, @owner_contacted_at)
    rescue SQLite3::ConstraintException
      return :fail
    end #end begin
  end #end write_database

  def contact_owner
     from_email = "dbctestingemail@gmail.com"
     from_name = "DBC"
     body = "Hi, I'm interested in your listing."

     Mail.defaults do
       delivery_method :sendmail
     end

     mail = Mail.new do
          from   from_email
            to   "felixtsai@yahoo.com"
       subject   "Interested in #{listing.title}"
          body   body
     end
     if mail.deliver
       return :success
     end
   end

end #end Listing
