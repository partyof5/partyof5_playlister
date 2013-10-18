class Student
  attr_accessor :name

  @@db = SQLite3::Database.new "students.db"
  

  def initialize
    @name = name
  end

  def self.reset_all
    @student
  end

  def insert
    true
  end

end