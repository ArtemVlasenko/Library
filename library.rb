require 'date'
require 'yaml'

class ValidationError < StandardError
end

class Library
  SAVE_LIBRARY = 'libraries.yml'.freeze
  attr_reader :books, :authors, :orders, :readers

  def initialize
    library = read_from_file
    @books = library&.books || []
    @authors = library&.authors || []
    @orders = library&.orders || []
    @readers = library&.readers || []
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

  # def save_to_file
  #   File.open(SAVE_LIBRARY, 'w') do |file|
  #     file.write YAML.dump(self)
  #   end
  # end

  def read_from_file
    return unless File.exist?(SAVE_LIBRARY)

    file_read = File.read(SAVE_LIBRARY)
    YAML.load(file_read)
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
# library.save_to_file
puts library.to_s

def check_validation(title, expected_error_message, &block)
  print title
  block.call
  puts " -> FAIL!!!"
rescue ValidationError => error
  result = error.message == expected_error_message
  puts result ? ' -> Pass' : ' -> FAIL!!!'
end

puts '**************************************'
check_validation("Test validation for book title is nil", "title must be given") do
  Book.new(nil, author)
end

check_validation("Test validation for book title is String", "title must be string") do
  Book.new(Array.new, author)
end

check_validation("Test validation for book title is empty", "title must be not empty") do
  Book.new('', author)
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for book author is nil", "author must be given") do
  Book.new('title', nil)
end

check_validation("Test validation for book author instance of Author", "author must be an instance of Author") do
  Book.new('title', author)
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for author name is nil", "name must be given") do
  Author.new(nil, 'biography')
end

check_validation("Test validation for author name is String", "name must be string") do
  Author.new(Array.new, 'biography')
end

check_validation("Test validation for author name is empty", "name must be not empty") do
  Author.new('', 'biography')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for author biography is nil", "biography must be given") do
  Author.new('name', nil)
end

check_validation("Test validation for author biography is String", "biography must be string") do
  Author.new('name', Array.new)
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for order book is nil", "book must be given") do
  Order.new(nil, 'reader', date = Date.today)
end

check_validation("Test validation for order book instance of Book", "book must be an instance of Book") do
  Order.new(book, 'reader')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for order reader is nil", "reader must be given") do
  Order.new('book', nil)
end

check_validation("Test validation for order reader instance of Reader", "reader must be an instance of Reader") do
  Order.new('book', reader)
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for order date is nil", "date must be given") do
  Order.new('book', 'reader', nil)
end

check_validation("Test validation for order date instance of Date", "date must be an instance of Date") do
  Order.new('book', 'reader', Date)
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for reader name is nil", "name must be given") do
  Reader.new(nil, 'email', 'city', 'street', 'house')
end

check_validation("Test validation for reader name is String", "name must be string") do
  Reader.new(Array.new, 'email', 'city', 'street', 'house')
end

check_validation("Test validation for reader name is empty", "name must be not empty") do
  Reader.new('', 'email', 'city', 'street', 'house')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for reader email is nil", "email must be given") do
  Reader.new('name', nil, 'city', 'street', 'house')
end

check_validation("Test validation for reader email is String", "email must be string") do
  Reader.new('name', Array.new, 'city', 'street', 'house')
end

check_validation("Test validation for reader email is empty", "email must be not empty") do
  Reader.new('name', '', 'city', 'street', 'house')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for reader city is nil", "city must be given") do
  Reader.new('name', 'email', nil, 'street', 'house')
end

check_validation("Test validation for reader city is String", "city must be string") do
  Reader.new('name', 'email', Array.new, 'street', 'house')
end

check_validation("Test validation for reader city is empty", "city must be not empty") do
  Reader.new('name', 'email', '', 'street', 'house')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for reader street is nil", "street must be given") do
  Reader.new('name', 'email', 'city', nil, 'house')
end

check_validation("Test validation for reader street is String", "street must be string") do
  Reader.new('name', 'email', 'city', Array.new, 'house')
end

check_validation("Test validation for reader street is empty", "street must be not empty") do
  Reader.new('name', 'email', 'city', '', 'house')
end
puts '*****************************************'

puts '**************************************'
check_validation("Test validation for reader house is nil", "house must be given") do
  Reader.new('name', 'email', 'city', 'street', nil)
end

check_validation("Test validation for reader house is String", "house must be integer") do
  Reader.new('name', 'email', 'city', 'street', Array.new)
end

check_validation("Test validation for reader house is positive", "house must be positive") do
  Reader.new('name', 'email', 'city', 'street', 0)
end
puts '*****************************************'
