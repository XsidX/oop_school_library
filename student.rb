require_relative 'person'

class Student < Person
  def initialize(classroom)
    super(age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
