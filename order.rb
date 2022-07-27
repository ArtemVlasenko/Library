class Order

  def initialize(book, reader,  date)
    @book = book
    @reader = reader
    @date = date
    validate(book, reader, date)
  end


book < class Book
reader < class Reader
date < class Date


end

books = Book.new
readers = Reader.new
dates = Date.new
