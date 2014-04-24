require 'cinch'
require './plugins/me'
require './plugins/duckduckgo'

beethoven = Cinch::Bot.new do

  #FILE = "./both0veen.yml"
  #yaml = YAML::load File.open(FILE)

  configure do |c|
    c.server = "irc.freenode.net" #yaml[:server]
    c.nick = "both0veen"          #yaml[:nick]
    c.channels= ["#rubythoven"]   #yaml[:channels]
    c.plugins.plugins = [Me, Duckduckgo]
  end
end

beethoven.start
