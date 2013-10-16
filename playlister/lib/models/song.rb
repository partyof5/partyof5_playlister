class Song
  attr_accessor :name, :genre, :artist

  @@songs = []

  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def genre
    @genre
  end

  def self.all
    @@songs
  end

  def self.find_by_name(string)
    @@songs.detect{|s| s.name.downcase == string.downcase}
  end

end