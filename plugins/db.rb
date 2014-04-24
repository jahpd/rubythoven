require 'mongoid'

module DB

  class Artist
    include Mongoid::Document
    field :name, type: String
    field :link, type: String
  end

end
