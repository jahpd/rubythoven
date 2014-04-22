require 'cinch'
require 'unirest'
require './db'

class Me

 include Cinch::Plugin
 include DB

 WIKIPEDIA_URL = "https://en.wikipedia.org/wiki/Beethoven"
 GLEN_GOULD_URL = "https://www.youtube.com/watch?v=-yzEbcgDCrQ"
 CHARLIE_THE_UNICORN = "https://www.youtube.com/watch?v=Fu2DcHzokew"

 match(/beethoven where  ([^ ]+) ([^ ]+\?)$/, :method => :where_i)
 def where_i(m, composer, question)
   db = get_db_ "rubythoven-profile-#{composer}"
   db.find.each {|doc|
     if doc[question].nil?
       m.reply "I dont know where #{composer} #{question}"
     else
       m.reply "[#{doc.heading}]"
     end
   }
 end
 
 match(/beethoven found informations about ([^ ]+)/, :method => :where_i_set)
 def where_i_set(m, composer)
   db = get_db_ "rubythoven-profile-#{composer}"
   response = Unirest::get "https://duckduckgo-duckduckgo-zero-click-info.p.mashape.com/?q=#{composer}&callback=process_duckduckgo&no_html=1&no_redirect=1&skip_disambig=1&format=json", 
  headers: { 
    "X-Mashape-Authorization" => "5DmST0ESUq3rsQa1HwRRYxwLBrmmDfHP"
  }
 
   m.reply "Ok, I found"
   db.insert(response)
   m.reply "[#{response}]"
 end 

end
