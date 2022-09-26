require_relative 'student'

class Teacher < Person
  def initialize(specialization)
    super(age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
