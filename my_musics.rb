require 'cinch'

class MyMusics

 include Cinch::Plugin

 YOUTUBE_URL = "https://www.youtube.com/results?search_query="
 VIMEO_URL = "http://vimeo.com/search?q="
 
 # !beethoven search composer <composer> on <search_engine> for  <queries>
 match(/beethoven search composer ([^ ]+) on (youtube|vimeo) for ([^ ].+)$/, :method=> :query_engine)
 def query_engine(m, composer, engine, query)
   url = ""
   if engine == "youtube"
     url = "#{YOUTUBE_URL}#{composer}"
     reply_engine_query(m, engine, query, url)
   elsif engine == "vimeo"
     url = "#{VIMEO_URL}#{composer}"
     reply_engine_query(m, engine, query, url)
   else
     m.reply "engine #{engine} isnt have support"
     m.reply "if you want help develop-me, do some contact in channels #labmacambira, #rubythoven or forkme in https://github.com/jahpd/bothoveen"
   end
 end

 def reply_engine_query(m, engine, query, url)
   query.split.each{|q| url += "+#{q}"}
   m.reply "I'm marvellous: a lot of dudes playing my music here in #{engine}: #{url}"
 end

end
