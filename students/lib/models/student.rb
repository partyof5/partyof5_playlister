class Student
	attr_accessor :name, :image, :title, :blurb, :saved_to_db, :id

  if File.exists?('students.db')
    File.delete('students.db')
  end

	@@db = SQLite3::Database.new "students.db"
  @@db.execute %Q{
    CREATE TABLE students (
    	id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      image TEXT,
      title TEXT,
      blurb TEXT)
  }

# ================ Instance Level Methods ================= #

  def initialize
  	@saved_to_db = false
  end

  def insert
   	sql = "INSERT INTO students (name, image, title, blurb) VALUES (?,?,?,?)"
    result = @@db.execute(sql, self.name, self.image, self.title, self.blurb)
    sql = "SELECT id FROM students WHERE name = ? ORDER BY id DESC LIMIT 1"
    result = @@db.execute(sql, self.name)
    self.id = result.flatten.first
    saved_to_db!
  end

  def update
    if saved_to_db?
      sql = "UPDATE students SET name = ?, image = ?, title = ?, blurb = ?  WHERE id = ?"
      result = @@db.execute(sql, self.name, self.image, self.title, self.blurb, self.id)
      saved_to_db!
    end
  end

   def saved_to_db!
    @saved_to_db = true
  end

  def saved_to_db?
    @saved_to_db
  end

  def save
  	if saved_to_db? == false
  		insert
  	else
  		update
  	end
  end

# ================== Class Level Methods ================== #

	def self.reset_all
	end

  def self.new_from_db(row)
    s = Student.new
    s.id = row[0]
    s.name = row[1]
    s.image = row[2]
    s.title = row[3]
    s.blurb = row[4]
    s.saved_to_db!
    s
  end

  def self.find(id_query)
  	# look into the Student array and find a student by his/her id
  	search = "SELECT * FROM students WHERE id = ?"
  	result = @@db.execute(search, id_query).first
  	found_student = self.new_from_db(result)
  end


end