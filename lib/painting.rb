class Painting
  @@data = []
  @@artist_lookup = Hash.new{|h,k| h[k] = []}

  def self.create(id, title, artist, value)
    @@data << (new_p = Painting.new(id, title, artist, value))
    @@artist_lookup[artist] << new_p
    new_p
  end

  attr_reader :value

  def initialize(id, title, artist, value)
    @id, @title, @artist, @value = id, title, artist, value
  end
end
