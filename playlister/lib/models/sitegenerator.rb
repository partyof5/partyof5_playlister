class SiteGenerator
  attr_accessor :artists

  @artists = []

  def initialize
    @artists
  end

  def call
    # we need to iterate through all artists and generate a page for each artist based on artist.erb

    file = File.open("_site/artists.html", 'w') 
    artists_template = File.read('lib/views/artists.erb')
    renderer = ERB.new(artists_template)
    html = renderer.result(binding)    
    file.write(html)


    Artist.all.each do |artist|
      File.open("_site/artists/#{artist.url}", 'w') do |file|
        artist_template = File.read('lib/views/artist.erb')
        renderer = ERB.new(artist_template)
        html = renderer.result(binding)
        file.write(html) 
      end
    end

    Genre.all.each do |genre|
      File.open("_site/genres/#{genre.name}", 'w') do |file|
        genre_template = File.read('lib/views/genres.erb')
        renderer = ERB.new(genre_template)
        html = renderer.result(binding)
        file.write(html) 
      end
    end

  end

end

