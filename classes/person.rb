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
end

# person = Person.new(22, 'maximilianus')
# p person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name
