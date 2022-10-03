require './classes/person'
require './classes/student'
require './classes/classroom'
require './classes/teacher'
require './classes/rental'
require './classes/book'

class App
  def initialize
    puts 'Welcome to School Library App!'
  end

  def list_people
    puts 'List of people:'
    puts Person.all.empty? ? 'No people available yet' : Person.all
  end
  
  def create_teacher
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)

    puts
    puts 'Person created successfully'
    puts teacher
  end

  def create_student
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(Classroom.new(rand(100..108)), age, name, parent_permission)

    puts
    puts 'Person created successfully'
    puts student
  end

  def create_person
    puts
    puts 'Do you want to create a student (1) or a Teacher (2)? [Input the number]'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts
      puts 'That is not a valid input'
    end
  end

  def person
    puts 'Select a person from the following list by number (not id)'
    puts Person.all
    person = gets.chomp.to_i

    if person > Person.all.length || person.negative?
      puts 'Invalid person number'
      return
    end
    person
  end

  def create_rental
    puts
    book_class = Book.select_book_for_renting
    puts
    person_class = person
    puts
    puts 'Date:'
    date = gets.chomp

    rental = Rental.new(date, Book.all[book_class], Person.all[person_class])

    puts
    puts 'Rental created successfully'
    puts rental
  end

  def list_rentals_by_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i

    rentals_by_person = Person.all.find { |person| person.id == id }

    puts
    puts 'Rentals:'
    puts rentals_by_person.rentals
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
      list_people
    when '3'
      create_person
    when '4'
      Book.create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
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
