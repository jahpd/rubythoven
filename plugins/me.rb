# -*- coding: utf-8 -*-
require 'cinch'

class Me

   include Cinch::Plugin
   VERSION = "0.0.1"
   match(/whoami/, :method => :identifica)
   def identifica(m)
     m.reply "#{Ruby::DESCRIPTION}-Me plugin v#{VERSION}"
     m.reply "Posso ser baixado e compartilhado em https://github.com/jahpd/rubythoven"
   end

end
