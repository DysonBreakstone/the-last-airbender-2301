class Resident
  attr_reader :name,
              :photo_url,
              :allies,
              :enemies,
              :affiliations

  def initialize(info)
    @photo_url = info[:photoUrl] if info[:photoUrl]
    @name = info[:name]
    @allies = info[:allies]
    @enemies = info[:enemies]
    @affiliations = info[:affiliation]
  end
end