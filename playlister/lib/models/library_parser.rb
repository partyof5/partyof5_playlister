class LibraryParser
  attr_accessor :songs, :artists, :genres

  def initialize
    @songs = []
    @artists = []
    @genres = []
  end

  def call
    self.add_objects
  end

  def files
    Dir.entries('./data/').collect do |f|
      if f.start_with?(".")
        next
      else
        f
      end
    end.compact
  end

  def parse(files)
    files.collect do |x|
      x.split(/ - | \[|\].mp3/)
    end
  end

  def add_objects
    self.parse(files).collect do |mini_array|
      song = Song.new
      song.artist = Artist.find_or_create_by_name(mini_array[0])
      song.genre = Genre.find_or_create_by_name(mini_array[2])   
      song.name = mini_array[1]
      song
    end
  end

end

