class SiteGenerator
  attr_accessor :artists

  @artists = []

  def initialize
    @artists
  end

  def call
    # we need to iterate through all artists and generate a page for each artist based on artist.erb
    Artist.all.each do |artist|
      File.open(artist.url, 'w') { |file| file.write("your text") }
    end
  end

end

