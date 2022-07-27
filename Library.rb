class Library
  def add_book(book)
    @books << book
  end

  def to_s
    "Books: #{@books.size}"
  end
end

class Book

end

library = Library.new
# book = Book.new
# library.add_book(book)
# puts library.to_s
puts "end"
