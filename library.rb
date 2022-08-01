class Library

  def initialize
    @books = []
    @authors = []
    @orders = []
    @readers = []
  end

  def add_book(book)
    @books << book
  end

  def add_author(author)
    @authors << author
  end

  def to_s
    "Books: #{@books.size} "\
    "Authors: #{@authors.size} "\
    "Orders: #{@orders.size} "\
    "Readers: #{@readers.size}"
  end
end

class Book
  attr_reader :title, :autor
  def initialize(title, autor)
    @title = title
    @autor = autor
  end

end

class Author
  attr_reader :name, :biography
  def initialize(name, biography)
    @name = name
    @biography = biography
  end
end

class Order < Book
  attr_reader :book, :reader, :date
  def initialize(book, reader, date)

    @reader = reader
    @date = date
  end
end

class Reader
  attr_reader :name, :email, :city, :street, :house
  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end


end


library = Library.new
book = Book.new(3, 45)
order = Order.new(10, 10, 10, Time.now)
author = Author.new(44, 55)
reader = Reader.new(9, 9, 9, 9, 9)
library.add_book(book)
library.add_author(author)

puts library.to_s
puts order.book
puts order.reader
puts order.date
puts order.title
puts reader
