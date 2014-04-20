require 'cinch'

class MyMusics

 include Cinch::Plugin

 
 VIMEO_URL = "http://vimeo.com/search?q="
 
 # !beethoven search composer <composer> on <search_engine> for  <queries>
 match(/beethoven search composer ([^ ]+) on (youtube|vimeo) for ([^ ].+)$/, :method=> :query_engine)
 def query_engine(m, composer, engine, query)
     m.reply "engine #{engine} isnt have support"
     m.reply "if you want help develop-me, do some contact in channels #labmacambira, #rubythoven or forkme in https://github.com/jahpd/rubythoven"
   end
 end

 def reply_engine_query(m, engine, query, url)
   query.split.each{|q| url += "+#{q}"}
   doc = Nokogiri::HTML open(url)
   result = doc.css('div#search-results div.result-item-main-content')[0]
   title = result.at('h3').text
   link = "www.youtube.com"+"#{result.at('a')[:href]}"
   desc = result.at('p.description').text

    rescue
        "No results found"
    else
      CGI.unescape_html "#{title} - #{desc} - #{link}"

    end
 end

end
