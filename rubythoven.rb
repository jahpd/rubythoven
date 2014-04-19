require 'cinch'
require './me'
require './ola'
require './my_musics'

beethoven = Cinch::Bot.new do

  configure do |c|
    c.server = "irc.freenode.net"
    c.nick = "both0veen"
    c.channels= ["#rubythoven"]
    c.plugins.plugins = [Me, Ola, MyMusics]
  end

end

beethoven.start
