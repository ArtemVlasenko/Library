require 'date'
require 'yaml'
require 'pry'
require_relative 'module_validation'
require_relative 'tests'

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

  def top_readers(quantity = 1)
    @orders#.
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
  include ModuleValidation
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
    validate_presence(@title, "title must be given")
    if !@title.is_a?(String)
      raise ValidationError, "title must be string"
    elsif @title.empty?
      raise ValidationError, "title must be not empty"
    end
    validate_presence(@author, "author must be given")
    if @author.is_a?(Author)
      raise ValidationError, "author must be an instance of Author"
    end
  end
end

class Author
  include ModuleValidation
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
    if @biography
      if !@biography.is_a?(String)
      raise ValidationError, "biography must be string"
      elsif @biography.empty?
        raise ValidationError, "biography must be not empty"
      end
    end
  end
end

class Order
  include ModuleValidation
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
  include ModuleValidation
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

run_validation_tests

# Top Reader

def check_top_reader
  # AAA principle
  # Arrange - prepare data for test
    # Create library
    library = Library.new
    # Add 1 Author to library
    #...Add code here
    # Add 5 books to library
    #...Add code here
    # Add 3 reader to library
    #...Add code here
    reader_1 = Reader.new
    # Create 3 orders for reader_1
    #...Add code here
    # Create 2 orders for reader_2
    #...Add code here
    # Create 1 order for reader_3
    #...Add code here
  # Act - execute
    result = library.top_readers
  # Assert - chech execution result
    puts '*' * 100
    print 'TOP READER TEST: '
    puts result == [reader_1] ? "PASS" : 'FAIL'
end

check_top_reader
