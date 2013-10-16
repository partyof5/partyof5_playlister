require_relative '../config/environment'


class CLIPlaylister
  # CLIStudent.new(students) --> Where students are a bunch of student instances.
  # CLIStudent.call
 
  # The CLIStudent should have a browse (which lists all students), a help, an exit, and a select (by ID or name), 
  # which will select all the data of a student.
  attr_accessor :songs
  APPROVED_COMMANDS = [:browse, :help, :exit, :play]

  def initialize(students)
    @students = students.collect {|s| Student.new(s)}
    @on = true
  end

  def on?
    @on
  end

  def help
    puts "Please type help, browse, select (name or ID), or exit."
    self.command_request
  end

  def command(input)
    if APPROVED_COMMANDS.include?(input.strip.downcase.to_sym)
      self.send(input.strip.downcase.to_sym) # send to either the browse, help, or exit methods (which I've defined)
    elsif input.start_with?("select")
      select_request = input.split("select").last.strip
      self.select(select_request)
    else
      "Didn't quite understand that.\n
      Please type help, browse, select (name or ID), or exit."
    end
  end

  def browse
    self.students.all 
  end

  def select(select_request)
    if select_request 

  end

  def call
    while self.on?
      self.help
    end
  end

  def exit
    puts "Goodbye!"
    @on = false
  end

  def command_request
    self.command(gets.strip)
  end


parser = LibraryParser.new
parser.call

# Generator.new

end