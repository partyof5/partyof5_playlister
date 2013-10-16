class Song
  attr_accessor :name, :genre, :artist

  @@songs = []

  def genre=(genre)
    @genre = genre
    # need access to genre just assigned and song that was just assigned to
    genre.songs << self
  end

  def genre
    @genre
  end

  def self.all
    @@songs
  end

end