require 'cinch'
require './me'
require './ola'
require './youtube'

beethoven = Cinch::Bot.new do

  configure do |c|
    c.server = "irc.freenode.net"
    c.nick = "both0veen"
    c.channels= ["#rubythoven"]
    c.plugins.plugins = [Me, Ola, Youtube]
  end

end

beethoven.start
