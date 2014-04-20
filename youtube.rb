require 'cinch'
require 'httparty'
require 'cgi'
require 'nokogiri'

class Youtube
  
  include Cinch::Plugin
  include HTTParty

  YOUTUBE_BASE_URL = "https://www.youtube.com/results?q"
  YOUTUBE_CLASS_LIST = "li.yt-lockup.clearfix.yt-uix-tile.result-item-padding.yt-lockup-video.yt-lockup-tile"
  YOUTUBE_A_REF = "a.yt-uix-sessionlink.yt-uix-tile-link.spf-link.yt-ui-ellipsis.yt-ui-ellipsis-2"

  # !beethoven on youtube search composer <composer> for <query>
  match(/beethoven on youtube search composer ([^ ]+) for ([^ ]+)/, method: :search_video)
  def search_video(m, composer, query)
    response = HTTParty.get "#{YOUTUBE_BASE_URL}=#{composer}+#{CGI.escape(query)}"
    body = response.body
    code = response.code
    message = response.message

    if response
      m.reply "#{m.user.nick} #{message}: i found (status #{code})"

      doc = Nokogiri::HTML(body)

      if doc
        list = doc.css YOUTUBE_CLASS_LIST
        if list
          m.reply "I found #{list.length} matchs; listing first 10"
          list.each_with_index {|li, i|
            if i < 10
              a = li.css YOUTUBE_A_REF
              if a
                m.reply "[#{i}]"
              end
            end
          }
        elsif
          m.reply "Any matchs found :P"
        end
      elsif
        m.reply "Any match found :P"
      end
    end

  end

end
