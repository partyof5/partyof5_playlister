class Genre
  attr_accessor :name, :songs, :artists

  @@genres = []

  def initialize(name = nil)
    @name = name
    @songs = []
    @artists = []
    @@genres << self if !@@genres.include?(self)
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

  def self.all
    @@genres
  end

  def self.count
    @@genres.size
  end

  def self.reset_genres
    @@genres.clear
  end

# To do last 3 rspec tests
  def ==(other_genre)
    self.name == other_genre.name
  end
  
end