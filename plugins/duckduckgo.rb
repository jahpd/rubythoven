require 'unirest'
require 'yaml'
require 'cinch'
require 'nokogiri'
require './specs/links'

class Duckduckgo

  include Rubythoven
  include Cinch::Plugin

  match(/learn about composer ([^ ]+)/, :method => :ddg)
  def ddg(m, compositor)
    get m, compositor do |response|
      unless response.code == 200
        m.reply "#{m.user.nick}, I got response #{response.code}"
      else
        reply m, response
      end
    end  
  end

  protected

  def get(m, query, &block)
    yml = YAML::load File.open('./mashape.yml')
    yield Unirest::get "#{BaseURI::DUCKDUCKGO}#{query}#{QueryURI::DUCKDUCKGO}", headers: { "X-Mashape-Authorization" => yml["api_key"] }
  end

  def reply(m, response)
    _def = response.body["Definition"]
    _defAbsSrc = response.body["AbstractSource"]
    _defSrc = response.body["DefinitionSource"]
    heading = response.body["Heading"]
    _defUrl = response.body["DefinitionURL"]
    relTopics = response.body["RelatedTopics"]
    
    m.reply "#{m.user.nick}, you said #{heading}:"
    m.reply "[Definition] #{_def} (#{_defAbsSrc}-#{_defSrc}) - #{_defUrl}"
        
    relTopics.each {|topic|
      a = Nokogiri::HTML(topic["Result"])
      link = a.css('a[href]')
      text = topic["Text"]
      m.reply "[RelatedTopic] #{text} - #{link}"
    }
  end
  
end
