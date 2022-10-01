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
end
