require 'yaml'

def ask(message)
  puts message
  STDIN.gets.chomp
end

task :run do
  sh "ruby rubythoven.rb"
end

task "build:bot" do
  server = ask("Enter the server name (Defaults irc.freenode.net") || "irc.freenode.net"
  nick = ask("Enter bot's nickname")
  channels = ask("type channels you will enter splited by space").split
  puts "saving on ./#{nick}.yml"
  
  File.open("#{nick}.yml", 'w') do |f|  
    string = YAML::dump({:server => server, :nick => nick, :channels => channels})
    f.write(string)
  end
end

task "build:mashape" do
  api_key = ask("Enter the api_key to mashape (used in duckduckgo searchs)")
  puts "saving on ./mashape.yml"
  
  File.open("mashape.yml", 'w') do |f|  
    string = YAML::dump({:api_key => api_key})
    f.write(string)
  end
end  
  