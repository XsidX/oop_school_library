require_relative 'student'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "#{super} [Teacher] Name: #{name}, ID: #{id}, Age: #{age}"
  end

  def self.create_teacher
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Specialization:'
    specialization = gets.chomp

    teacher = new(specialization, age, name)

    puts
    puts 'Person created successfully'
    puts teacher

    teacher.save
  end

  def save

    if(File.exist?('teachers.json'))
      teachers_file = File.read('teachers.json')
      teachers = JSON.parse(teachers_file)
      teachers << { age: self.age, name: self.name, specialization: self.specialization}

      File.open('teachers.json', 'w') do |file|
        file.write(JSON.pretty_generate(teachers))
      end
    else
      File.open('teachers.json', 'w') do |file|
        file.write(JSON.pretty_generate([{ age: self.age, name: self.name, specialization: self.specialization }]))
      end
    end

  end

  def self.load_teachers
    if(File.exist?('teachers.json'))
      teachers_file = File.read('teachers.json')
      teachers = JSON.parse(teachers_file)
      teachers.each do |teacher|
        new(teacher['age'], teacher['name'], teacher['specialization'])
      end
    end
  end

end
