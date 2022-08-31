require "date"
require 'yaml'


class ValidationError < StandardError
end

class Library
  SAVE_LIBRARY = 'librarys.txt'
  attr_reader :books, :authors, :orders, :readers
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

  def save_to_file
    File.open(SAVE_LIBRARY, 'w') do |file|
      file.puts YAML::dump(self)
    end
  end

  def read_from_file
    file = File.read(SAVE_LIBRARY)
    file = YAML.dump(file)
    YAML.load(file)
    puts File.exists?(SAVE_LIBRARY)
    return unless File.exists?(SAVE_LIBRARY)
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
    "{ title: #{title}, author: #{author} }"
  end

  private

  def validate_book
    if @title.nil?
      raise ValidationError, "title must be given"
    elsif !@title.is_a?(String)
      raise ValidationError, "title must be string"
    elsif @title.empty?
      raise ValidationError, "title must be not empty"
    end
    if @author.nil?
      raise ValidationError, "author must be given"
    elsif @author.is_a?(Author)
      raise ValidationError, "author must be an instance of Author"
    end
  end
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

  def validate_autor
    if @name.nil?
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
    if @biography.nil?
      raise ValidationError, "biography must be given"
    elsif !@biography.is_a?(String)
      raise ValidationError, "biography must be string"
    end
  end
end

class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    validate_order
  end

  def to_s
    "{ book: #{book}, reader: #{reader}, date: #{date} }"
  end

  private

  def validate_order
    if @book.nil?
      raise ValidationError, "book must be given"
    elsif @book.is_a?(Book)
      raise ValidationError, "book must be an instance of Book"
    end
    if @reader.nil?
      raise ValidationError, "reader must be given"
    elsif @reader.is_a?(Reader)
      raise ValidationError, "reader must be an instance of Reader"
    end
    if @date.nil?
      raise ValidationError, "date must be given"
    elsif !@date.is_a?(Date)
      raise ValidationError, "date must be an instance of Date"
    end
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

  private

  def validate_reader
    if @name.nil?
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
    if @email.nil?
      raise ValidationError, "email must be given"
    elsif !@email.is_a?(String)
      raise ValidationError, "email must be string"
    elsif @email.empty?
      raise ValidationError, "email must be not empty"
    end
    if @city.nil?
      raise ValidationError, "city must be given"
    elsif !@city.is_a?(String)
      raise ValidationError, "city must be string"
    elsif @city.empty?
      raise ValidationError, "city must be not empty"
    end
    if @street.nil?
      raise ValidationError, "street must be given"
    elsif !@street.is_a?(String)
      raise ValidationError, "street must be string"
    elsif @street.empty?
      raise ValidationError, "street must be not empty"
    end
    if @house.nil?
      raise ValidationError, "house must be given"
    elsif !@house.is_a?(Integer)
      raise ValidationError, "house must be integer"
    elsif !@house.positive?
      raise ValidationError, "house must be positive"
    end
  end
end

library = Library.new
author = Author.new('10', '1')
book = Book.new('1', '1')
reader = Reader.new('name1', 'email1', 'city1', 'street1', 1)
order = Order.new('0', '0')
library.add_book(book)
library.add_author(author)
library.add_order(order)
library.add_reader(reader)

# output = File.new('to_s.yml', 'w')
# output.puts YAML.dump(library)
# output.close

# author_name_nil = Author.new('nil', 'biography')
# author_biography_class = Author.new('Name', String.new)

# begin
#   puts '**************************************'
#   puts "Test validation for book title is nil"
#   Book.new(nil, author)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "title must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book title is String"
#   Book.new(Array.new, author)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "title must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book title is empty"
#   Book.new('', author)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "title must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book author is nil"
#   Book.new('title', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "author must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book instance of Author"
#   Book.new('title', author)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "author must be an instance of Author"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for author name is nil"
#   Author.new(nil, 'biography')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for author name is String"
#   Author.new(Array.new, 'biography')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for author name is empty"
#   Author.new('', 'biography')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book biography is nil"
#   Author.new('name', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "biography must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for book biography is String"
#   Author.new('name', Array.new)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "biography must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order book is nil"
#   Order.new(nil, reader)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "book must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order book instance of Book"
#   Order.new(book, reader)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "book must be an instance of Book"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order reader is nil"
#   Order.new('book', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "reader must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order reader instance of Reader"
#   Order.new('book', reader)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "reader must be an instance of Reader"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order date is nil"
#   Order.new('book', 'date')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "date must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order date instance of Date"
#   Order.new('book', reader)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "date must be an instance of Date"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader name is nil"
#   Reader.new(nil, 'email', 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader name is String"
#   Reader.new(Array.new, 'email', 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader name is empty"
#   Reader.new('', 'email', 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "name must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader email is nil"
#   Reader.new('name', nil, 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "email must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader email is String"
#   Reader.new('name', Array.new, 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "email must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader email is empty"
#   Reader.new('name', '', 'city', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "email must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader city is nil"
#   Reader.new('name', 'email', nil, 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "city must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader city is String"
#   Reader.new('name', 'email', Array.new, 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "city must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader city is empty"
#   Reader.new('name', 'email', '', 'street', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "city must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader street is nil"
#   Reader.new('name', 'email', 'city', nil, 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "street must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader street is String"
#   Reader.new('name', 'email', 'city', Array.new, 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "street must be string"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader street is empty"
#   Reader.new('name', 'email', 'city', '', 'house')
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "street must be not empty"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader house is nil"
#   Reader.new('name', 'email', 'city', 'street', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "house must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader house is String"
#   Reader.new('name', 'email', 'city', 'street', Array.new)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "house must be integer"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for reader house is positive"
#   Reader.new('name', 'email', 'city', 'street', 0)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message == "house must be positive"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end


#  author_error_nil = Author.new('0', '0')
# author_error_class = Author.new(0, '0')
#  author_error_empty = Author.new('0', '0')
# book_error_nil = Book.new()
# book_error_class = Book.new()
# book_error_empty = Book.new()
# reader_error_nil = Reader.new()
# reader_error_class = Reader.new()
# reader_error_empty = Reader.new()
# order_error_nil = Order.new()
# order_error_class = Order.new()
# order_error_empty = Order.new()
#<class_name_downcase>_<atrribute>_<validation>
library.read_from_file
library.save_to_file
puts library.to_s

#делают dump библиотеки и присваиваю его в переменную, записываю на диск
