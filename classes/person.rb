require_relative 'nameable'
require_relative 'decorators'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()

    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    name
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    index = Person.all.index(self)
    "#{index})"
  end

  private

  def of_age?
    age >= 18
  end

  def self.list_people
    puts 'List of people:'
    puts self.all.empty? ? 'No people available yet' : self.all
  end

  def self.create_person
    puts
    puts 'Do you want to create a student (1) or a Teacher (2)? [Input the number]'
    option = gets.chomp

    case option
    when '1'
      Student.create_student
    when '2'
      Teacher.create_teacher
    else
      puts
      puts 'That is not a valid input'
    end
  end
end
