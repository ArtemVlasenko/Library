require "date"

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

  def add_order(order)
    @orders << order
  end

  def add_reader(reader)
    @readers << reader
  end

  def to_s
    "Books:\n #{@books.map(&:to_s).join("\n")}\n"\
    "Authors:\n #{@authors.map(&:to_s).join("\n")}\n"\
    "Orders:\n #{@orders.map(&:to_s).join("\n")}\n"\
    "Readers:\n #{@readers.map(&:to_s).join("\n")}"
  end

end

class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate_book
  end

  def to_s
    "{ title: #{title}, author:\n #{author}\n }"
  end

  def titles_book
    @title
  rescue ZeroDivisionError => e
    "argument must not be zero"
  end

  def authors_book
    @author
  rescue ZeroDivisionError => e
    "argument must not be zero"
  end

  private

  def validate_book
    if @title == 0
      raise ValidationError, "name must be given"
    elsif !@title.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @title.empty?
      raise ValidationError, "name must be not empty"
  end

  author < class Author

end

class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
    validate_autor
  end

  def to_s
    "{ name: #{name}, biography: #{biography} }"
  end

  private

  def names_author
    @name
  rescue ZeroDivisionError => e
    "argument must not be zero"
  end

  def biography_author
    @biography
  rescue ZeroDivisionError => e
    "argument must not be zero"
  end

  def validate_autor
    if @name == 0
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
  end
end

class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "{ book:\n #{book},\n reader:\n #{reader},\n date:\n #{date}\n }"
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
    validate_reader
  end

  def to_s
    "{ name: #{name}, email: #{email}, city: #{city}, street: #{street}, house: #{house} }"
  end

  def name_reader
    @name
  rescue ZeroDivisionError => e
    "argument must not be zero"
  end

  private

  def validate_reader
    if @name == 0
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
  end
end



library = Library.new
author = Author.new('name1', 'biography1')
book = Book.new('1', author)
reader = Reader.new('name1', 'email1', 'city1', 'street1', 1)
order = Order.new(book, reader)
library.add_book(book)
library.add_author(author)
library.add_order(order)
library.add_reader(reader)

puts library.to_s
puts book.titles
