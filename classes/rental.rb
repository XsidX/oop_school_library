class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    "Date: #{date}, Book \"#{book.title}\" by #{book.author}, Rented to: #{person.name}"
  end
end
