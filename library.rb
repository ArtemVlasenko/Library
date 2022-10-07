require 'date'
require 'yaml'
require 'pry'
require_relative 'module_validation'
require_relative 'tests'
require_relative 'book'
require_relative 'author'
require_relative 'order'
require_relative 'reader'

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
    result = @orders.group_by do |order|
      order.reader
    end
    top_readers = result.map {|k, array| [k, array.count]}.max_by {|k, array| array}.first
    # puts top_readers.name
    # key, top_readers = result.max_by{ |k, array| array.size }
      # puts top_readers.name
  end

  def popular_books(quantity = 1)
    result = @orders.group_by do |order|
      order.reader
    end

    # a = result.map {|k, v| [k, books]}.max_by {|k, array| array.size }
      # puts a
    binding.pry
  end

  def save_to_file
    File.open(SAVE_LIBRARY, 'w') do |file|
      file.write YAML.dump(self)
    end
  end

  def read_from_file
    return unless File.exist?(SAVE_LIBRARY)

    file_read = File.read(SAVE_LIBRARY)
    YAML.load(file_read)
  end
end

# run_validation_tests

# Top Reader

def check_top_reader
  # AAA principle
  # Arrange - prepare data for test
    # Create library
    library = Library.new
    # Add 1 Author to library
    author = Author.new("Taras Shevchenko", "Kobzar")
    library.add_author(author)
    # Add 5 books to library
    book_1 = Book.new("Taras_1", author)
    book_2 = Book.new("Taras_2", author)
    book_3 = Book.new("Taras_3", author)
    book_4 = Book.new("Taras_4", author)
    book_5 = Book.new("Taras_5", author)
    library.add_book(book_1)
    library.add_book(book_2)
    library.add_book(book_3)
    library.add_book(book_4)
    library.add_book(book_5)
    # Add 3 reader to library
    reader_1 = Reader.new("Artem", "email_1", "city_1", "street_1", 40)
    reader_2 = Reader.new("Borya", "email_2", "city_2", "street_2", 50)
    reader_3 = Reader.new("Dima", "email_3", "city_3", "street_3", 10)
    library.add_reader(reader_1)
    library.add_reader(reader_2)
    library.add_reader(reader_3)
    # Create 3 orders for reader_1
    order_1 = Order.new(book_1, reader_1)
    order_2 = Order.new(book_2, reader_1)
    order_3 = Order.new(book_3, reader_1)
    library.add_order(order_1)
    library.add_order(order_2)
    library.add_order(order_3)
    # Create 2 orders for reader_2
    order_4 = Order.new(book_4, reader_2)
    order_5 = Order.new(book_5, reader_2)
    library.add_order(order_4)
    library.add_order(order_5)
    # Create 1 order for reader_3
    order_5 = Order.new(book_5, reader_3)
    library.add_order(order_5)

    result = library.top_readers
    result = library.popular_books
  # Assert - chech execution result
    puts '*' * 100
    print 'TOP READER TEST: '
    puts result == [reader_1] ? "PASS" : 'FAIL'
end

check_top_reader
