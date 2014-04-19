# -*- coding: utf-8 -*-
require 'cinch'

class Ola

  include Cinch::Plugin

  # !beethoven ola 
  match(/beethoven ola$/, :method=> :greet)
  def greet(m)
    m.reply "GGGEb, #{m.user.nick}"
  end

end
