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
      song.name = mini_array[1]
      song.artist = Artist.find_or_create_by_name(mini_array[0])
      song.genre = Genre.find_or_create_by_name(mini_array[2])     
    end
  end
end


# load './config/environment.rb'
# in CLI:  parser = LibraryParser.new
# create new instance of LibraryParser
# parser.call

# tap example:
    # Genre.new.tap{|g| g.name = string}
    # return a new genre that has the name string
    # g = Genre.new
    # g.name = string    
    # g


