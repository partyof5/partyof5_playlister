require_relative '../config/environment'

class CLIPlaylister
  attr_accessor :songs
  APPROVED_COMMANDS = [:list, :help, :exit]

  def initialize(songs)
    @songs = songs
    @on = true
  end

  def on?
    @on
  end

  def help
    puts "Please type 'help', 'list', 'play (song title)', or 'exit'."
    self.command_request
  end

  def command_request
    self.command(safe_input)
  end

  def safe_input
    gets.strip.downcase
  end

  def command(input)
    if APPROVED_COMMANDS.include?(input.to_sym)
      self.send(input.to_sym)
    elsif input.start_with?("play")
      song_request = input.split("play").last.strip
      self.play(song_request)
    else
      puts "Didn't quite understand that."
    end
  end

  def call
    while self.on?
      'Welcome to Playlister!'
      self.help
    end
  end

  def list
    songs.collect do |song|
      p "#{song.artist.name} - #{song.name}"
    end.sort
    puts "\n"
    p "Type 'play (song title)' to proceed"
    command(safe_input)
  end

  def play(song_request)
    puts "\n"
    found_song = Song.find_by_name(song_request)
    p "Now playing #{found_song.name} by #{found_song.artist.name}."
    puts "\n"
    p "What would you like to do next?"
    command(safe_input)
  end


  def exit
    puts "Thanks for using Playlister. Goodbye!"
    @on = false
  end


parser = LibraryParser.new

cli = CLIPlaylister.new(parser.call)
cli.call

end