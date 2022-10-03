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

  private

  def self.create_teacher
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Specialization:'
    specialization = gets.chomp

    teacher = self.new(specialization, age, name)

    puts
    puts 'Person created successfully'
    puts teacher
  end

end
