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
  end
end
