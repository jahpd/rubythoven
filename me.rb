require 'cinch'

class Me

 include Cinch::Plugin

 WIKIPEDIA_URL = "https://en.wikipedia.org/wiki/Beethoven"
 GLEN_GOULD_URL = "https://www.youtube.com/watch?v=-yzEbcgDCrQ"
 CHARLIE_THE_UNICORN = "https://www.youtube.com/watch?v=Fu2DcHzokew"

 match(/beethoven where you ([^ ]+)$/, :method => :where_i)
 def where_i(m, q)
   if q == "from"
     m.reply "#{m.user.nick}, im from europe, near Germany"
     m.reply "you can found more on #{WIKIPEDIA_URL}"
   elsif q == "born"
     m.reply "#{m.user.nick}, im not live-beign. im code of 01010101."
     m.reply "but someone make me."
   end
 end
 
 match(/beethoven who make you$/, :method => :where_i_make)
 def where_i_make(m)
   m.reply "#{m.user.nick}, oh, this is a smarter question"
   m.reply "a guy started me; you can grow-me on https://github.com/jahpd/rubythoven"
 end

 match(/beethoven what your favorite composition$/, :method => :favorite_composition)
 def favorite_composition(m)
   m.reply "as i say, a guy started me; i dont hear; im a bot;  but he likes hammerklavier (#{GLEN_GOULD_URL})"
 end

 match(/beethoven you drive$/, :method => :you_drive)
 def you_drive(m)
   m.reply "drive what? im bot with dead soul; maybe a boat or horses; maybe unicorn (#{CHARLIE_THE_UNICORN})"
 end

end
