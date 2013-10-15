class LibraryParser
  attr_accessor :songs, :artists, :genres

  def initialize
    @songs = []
    @artists = []
    @genres = []
  end

  def call
    parse(files)
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

  def add_artists
    a = Artist.new
    a.name = self.call.last[0]
    a.add_song_object_by_name(self.call.last[1])
  end


end



# in CLI:  parser = LibraryParser = new
# create new instance of LibraryParser
# parser.call

# break array into multi-dimensional array


# use artist, song and genre classes to iterate and gather all relevant data




