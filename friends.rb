require 'cinch'
require 'duck_duck_go'
require './db'

class Friends

  include Cinch::Plugin
  include DB

  # friends
  match(/beethoven know ([^ ]+\?)$/, :method => :search_friends)
  def search_friends(m, query)
    m.reply "no, but I can search"
    ddg = DuckDuckGo.new
    zci = ddg.zeroclickinfo query # ZeroClickInfo object
  
    begin
      coll = get_db_ "rubythoven-know-composers"
      m.reply "Ok, found"
      coll.insert(zci)
      m.reply "[#{zci.heading}]"
      m.reply "#{zci.abstract_text}(#{zci.first_url}) "
    rescue => e
      m.reply "Impossible to find any info #{e}"
    end
  end

end
