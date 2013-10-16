class Genre
  attr_accessor :name, :songs, :artists

  @@genres = []

  def initialize(name = nil)
    @name = name
    @songs = []
    # @artists = []
    @@genres << self if !@@genres.include?(self)
  end

  def artists
    @artists = self.songs.collect do |song|
      song.artist
    end
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

  def self.find_or_create_by_name(string)
     find_by_name(string) || create_by_name(string)
  end

  def self.find_by_name(string)
    @@genres.detect{|g| g.name == string}
  end

  def self.create_by_name(string)
    Genre.new.tap{|g| g.name = string}
  end

# To do last 3 rspec tests
  def ==(other_genre)
    self.name == other_genre.name
  end
  
end