require 'mongo'

module DB

  def get_db_(db)
    begin
      # connecting to the database
      # defaults to localhost:27017
      @@db=Mongo::Client.new 
      @@db["#{db}"]
    rescue
      m.reply "Error on find #{db}"
    end
  end

end
