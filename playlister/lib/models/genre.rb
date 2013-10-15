class Genre
  attr_accessor :name
  


  def initialize
    @songs = []
    @artists = []
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

  def ==(other_genre)
    self.name == other_genre.name
  end
end