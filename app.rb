require './classes/person'
require './classes/student'
require './classes/classroom'
require './classes/teacher'
require './classes/rental'
require './classes/book'

class App
  def initialize
    puts 'Welcome to School Library App!'
    # load data from json files
    Book.load_books
    Student.load_students
    Teacher.load_teachers
    Rental.load_rentals
  end

  def prompt
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def navigator(option)
    case option
    when '1'
      Book.list_books
    when '2'
      Person.list_people
    when '3'
      Person.create_person
    when '4'
      Book.create_book
    when '5'
      Rental.create_rental
    when '6'
      Rental.list_rentals_by_person_id
    else
      puts 'That is not a valid option'
    end
  end

  def run
    prompt

    option = gets.chomp

    if option == '7'
      puts 'Thank you for using this App!'
      exit
    end

    navigator(option)

    run
  end
end
