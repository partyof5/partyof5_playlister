class Genre
  attr_accessor :name, :songs, :artists

  @@genres = []

  def initialize
    @songs = []
    @artists = []
    @@genres << self if !@@genres.include?(self)
  end

  def songs=(songs)
    @songs = songs
  end

  def songs
    @songs
  end

  def artists=(artists)
    @artists = artists
  end

  def artists
    @artists = self.songs.collect do |song|
      song.artist
    end
    @artists
  end

# To do last 3 rspec tests
  def ==(other_genre)
    self.name == other_genre.name
  end
  
end