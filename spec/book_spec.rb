require '../classes/book'

describe Book do
  book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  book1 = Book.new('Harry Potter', 'J.K. Rowling')

  it 'should create a book' do
    expect(Book.all.length).to eql(2)
    expect(Book.all[0].title).to eql('Harry Potter')
    expect(Book.all[0].author).to eql('J.K. Rowling')
    expect(Book.all[1].title).to eql('The Hobbit')
    expect(Book.all[1].author).to eql('J.R.R. Tolkien')
  end

  it 'should list all books' do
    list_of_books = Book.list_books

    expect(list_of_books).to eq([book1, book])
  end
end
