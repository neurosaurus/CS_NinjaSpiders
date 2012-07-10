require 'sqlite3'
require './listing.rb'

  class DatabaseInterface

    def initialize
      @listings = []
      @listings_db = SQLite3::Database.new( "listings.db" )
      @listings_db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS listings (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title VARCHAR(128) NOT NULL,
          url VARCHAR(128) NOT NULL,
          email VARCHAR(64) NOT NULL,
          price VARCHAR(64) NULL,
          sent_at DATETIME NOT NULL
        );
      SQL
      # load_from_db
    end

    def read
      
         @temp_listings = @listings_db.execute( "select * from listings" )
         @temp_listings.each do |listing_array|
           @listings << Listing.new(listing_array[1], listing_array[2], listing_array[3], listing_array[4], listing_array[5])
          end
         return @listings
         #read the database and return an array of listing objects
       end
    
    def write(listing)
      @listings_db.execute <<-SQL
        INSERT INTO listings (title, url, email, price, sent_at)
         VALUES ("#{listing.title}", "#{listing.url}", "#{listing.email}", "#{listing.price}", "#{listing.sent_at}")
         SQL
    end

end #end Database

# write is for an individual listing object
# read method passes a 
    # def load_from_db
    #       tasks_array = @tasks_db.execute( "select * from tasks" )
    #       tasks_array.each { |task| @tasks << Task.new(task[1], task[0], task[2], task[3]) }
    #     end
    # 
    # 
    #     # def append(task_title)
    #     # end
    # 
    #     # def prepend
    #     # end
    # 
    # 
    #     def write(task_title)
    #       task = Task.new(task_title)
    #       @tasks_db.execute <<-SQL
    #         INSERT INTO tasks (title, created_at, completed_at) VALUES ("#{task.title}", "#{task.created_at}", "#{task.completed_at}")
    #       SQL
    #     end
    # 
    # 
    #     def delete(db_id)
    #       @tasks_db.execute <<-SQL
    #       DELETE FROM tasks
    #       WHERE id='#{db_id}'
    #       SQL
    #     end
    # 
    # 
    #     def print
    #       @tasks.each { |task| puts task.to_s }
    #     end
    # 
    #   end
    # 
    # end
    # 
    # 
    # # my_list = Todo::List.new()
    # # puts my_list.inspect
    # # my_list.write("do the dishes")
    # my_list2 = Todo::List.new()
    # my_list2.print
    # my_list2.delete(11)
    # 
    # ## need to add an attribute to task that keeps track of ordering.
    # ## need to add the console interaction
    # ## need to add rspec testing for the DB
    # 
