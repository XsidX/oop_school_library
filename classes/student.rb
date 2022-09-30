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
end
