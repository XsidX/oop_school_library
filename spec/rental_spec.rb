require '../classes/rental'
require '../classes/book'
require '../classes/student'
require '../classes/classroom'

describe Rental do
  student = Student.new(Classroom.new(rand(100..108)), 18, 'John', true)
  book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  $rental = Rental.new('2020-01-01', book, student)

  # mock Rental.rentals_by_person_id function
  before do
    allow(Rental).to receive(:rentals_by_person_id).and_return($rental.to_s)
  end

  it 'should create a rental' do
    expect(Rental.all.length).to eql(1)
    expect(Rental.all[0].date).to eql('2020-01-01')
    expect(Rental.all[0].person).to eql(student)
    expect(Rental.all[0].book).to eql(book)
  end

  it 'should list all rentals by a person id' do
    list_of_rentals = Rental.list_rentals

    expect(list_of_rentals).to eq($rental.to_s)
  end
end
