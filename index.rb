require "./classes/person"
require "./classes/student"
require "./classes/classroom"
require "./classes/teacher"
require "./classes/rental"
require "./classes/book"
require "./classes/decorators"
require "./classes/nameable"


sid = Person.new(23, 'sid')
brad = Person.new(25, 'brad')

harry_potter = Book.new('Harry Potter', 'J.K. Rowling')
hunger_games = Book.new('Hunger Games', 'Suzanne Collins')
eloquent_ruby = Book.new('Eloquent Ruby', 'Russ Olsen')

rental1 = Rental.new('2020-10-25', harry_potter, sid)
rental2 = Rental.new('2020-11-11', harry_potter, sid)

p sid.rentals.count
# => 2
puts
p sid.rentals.map { |rental| rental.book.title }
# => ["Harry Potter", "Harry Potter"]
puts
p hunger_games.rentals.count
# => 0
p harry_potter.rentals.count
# => 2
puts
p harry_potter.rentals.map { |rental| rental.person.name }
# => ["sid", "sid"]
puts



