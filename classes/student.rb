require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_s
    "#{super} [Student] Name: #{name}, ID: #{id}, Age: #{age}"
  end

  def self.create_student
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'

    student = new(Classroom.new(rand(100..108)), age, name, parent_permission)

    puts
    puts 'Person created successfully'
    puts student

    student.save
  end


  def save

    if(File.exist?('students.json'))
      students_file = File.read('students.json')
      students = JSON.parse(students_file)
      students << { age: self.age, name: self.name }

      File.open('students.json', 'w') do |file|
        file.write(JSON.pretty_generate(students))
      end
    else
      File.open('students.json', 'w') do |file|
        file.write(JSON.pretty_generate([{ age: self.age, name: self.name }]))
      end
    end

  end

  def self.load_students
    if(File.exist?('students.json'))
      students_file = File.read('students.json')
      students = JSON.parse(students_file)
      students.each do |student|
        new(student['age'], student['name'])
      end
    end
  end


end
