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
end
