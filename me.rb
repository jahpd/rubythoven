require 'cinch'

class Me

 include Cinch::Plugin

 WIKIPEDIA_URL = "https://en.wikipedia.org/wiki/Beethoven"
 GLEN_GOULD_URL = "https://www.youtube.com/watch?v=-yzEbcgDCrQ"

 match(/beethoven where you from? /, :method => :where_i_from)
 def where_i_from(m)
   m.reply "#{m.user.nick}, im from europe, near Germany"
   m.reply "you can found more on #{WIKIPEDIA_URL}"
 end

 match(/beethoven where you born? /, :method => :where_i_born)
 def where_i_born(m)
   m.reply "#{m.user.nick}, im not live-beign. im code of 01010101."
   m.reply "but someone make me."
 end
 
 match(/beethoven who make you? /, :method => :where_i_make)
 def where_i_make(m)
   m.reply "#{m.user.nick}, oh, this is a smarter question"
   m.reply "a guy started me; you can grow-me on https://github.com/jahpd/bothoveen"
 end

 match(/beethoven what your favorite composition? /, :method => :favorite_composition)
 def favorite_composition(m)
   m.reply "as i say, a guy started me; i dont hear; im a bot;  but he likes hammerklavier (#{GLEN_GOULD_URL})"
 end

 match(/beethoven you drive?/, :method => :you_drive)
 def yout_drive(m)
   m.reply "drive what? im bot with dead soul; maybe a boat or horses"
 end
end
