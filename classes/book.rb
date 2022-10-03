class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    index = Book.all.index(self)
    "#{index}) Title: \"#{title}\", Author: #{author}"
  end

  private

  def self.list_books
    puts 'List of books:'
    puts self.all.empty? ? 'No books available yet' : self.all
  end

  def self.create_book
    puts
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = self.new(title, author)

    puts
    puts 'Book created successfully'
    puts book
  end

  def self.select_book_for_renting
    puts 'Select a book from the following list by number'
    if self.all.empty?
      puts
      puts 'No books available'
      return
    end
    puts self.all
    book_idx = gets.chomp.to_i

    if book_idx > self.all.length || book_idx.negative?
      puts 'Invalid book number'
      return
    end
    book_idx
  end
end
