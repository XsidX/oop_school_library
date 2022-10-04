require_relative 'person'
require_relative 'book'

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

  def self.create_rental
    puts
    book_class = Book.select_book_for_renting
    puts
    person_class = Person.select_person_to_rent
    puts
    puts 'Date:'
    date = gets.chomp

    rental = new(date, Book.all[book_class], Person.all[person_class])

    puts
    puts 'Rental created successfully'
    puts rental
    rental.save
  end

  def self.list_rentals_by_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i

    rentals_by_person = Person.all.find { |person| person.id == id }

    puts
    puts 'Rentals:'
    puts rentals_by_person.rentals
  end

  def save

    if(File.exist?('rentals.json'))
      rentals_file = File.read('rentals.json')
      rentals = JSON.parse(rentals_file)
      rentals << { date: self.date, book: self.book, person: self.person}

      File.open('rentals.json', 'w') do |file|
        file.write(JSON.pretty_generate(rentals))
      end
    else
      File.open('rentals.json', 'w') do |file|
        file.write(JSON.pretty_generate([{ date: self.date, book: self.book, person: self.person}]))
      end
    end

  end

  def self.load_rentals
    if(File.exist?('rentals.json'))
      rentals_file = File.read('rentals.json')
      rentals = JSON.parse(rentals_file)
      rentals.each do |rental|
        new(rental['date'], rental['book'], rental['person'])
      end
    end
  end
end
