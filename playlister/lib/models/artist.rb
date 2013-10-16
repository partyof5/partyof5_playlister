class Artist
  attr_accessor :name, :songs

  @@artists = []

  def initialize
    @songs = []
    @@artists << self
  end

  def add_song(song)
    self.songs << song
  end

  def add_song_object_by_name(song_name)
    song = Song.new
    song.name = song_name
    add_song(song)
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end
  end

  def self.reset_artists
    @@artists.clear
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.size
  end

  def self.find_or_create_by_name(string)
     find_by_name(string) || create_by_name(string)
  end

  def self.find_by_name(string)
    @@artists.detect{|g| g.name == string}
  end

  def self.create_by_name(string)
    Artist.new.tap{|g| g.name = string}
  end

end