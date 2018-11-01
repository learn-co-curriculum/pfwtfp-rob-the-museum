require 'csv'

class Museum
  def self.new_from_csv
    # Here's the data file, pass this to CSV.read (see the CSV documentation for
    # more help!
    data_file = (File.join(File.dirname(__FILE__), '..', 'art_heist.csv'))

    CSV.foreach(data_file) do |row|
      gallery = Gallery.find_or_create_by_name(row[1])
      artist = Artist.find_or_create_by_name(row[3])
      painting = Painting.create(row[0], row[2], artist, row[4])
      artist.add_work(painting)
      gallery << painting
    end
  end

  def self.galleries
    Gallery.all
  end

  def self.biggest_gallery
    Gallery.biggest
  end

  def self.smallest_gallery
    Gallery.smallest
  end

  def self.artist_most_occurring
    Artist.most_prolific.name
  end

  def self.value_of_artist(artist_name)
    Artist.find_by_name("Vincent van Gogh").portfolio_value
  end
end
