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
    # elem = @orders = readers
    # puts  @orders = readers.size

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

run_validation_tests

# Top Reader

def check_top_reader
  # AAA principle
  # Arrange - prepare data for test
    # Create library
    library = Library.new
    # Add 1 Author to library
    #...Add code here
    author = library
    # Add 5 books to library
    #...Add code here
    book_1 = library
    book_2 = library
    book_3 = library
    book_4 = library
    book_5 = library
    # Add 3 reader to library
    #...Add code here
    reader_1 = library
    reader_2 = library
    reader_3 = library

    # Create 3 orders for reader_1
    #...Add code here
    order_1 = reader_1
    order_2 = reader_1
    order_3 = reader_1
    # Create 2 orders for reader_2
    #...Add code here
    order_4 = reader_1
    order_5 = reader_2

    # Create 1 order for reader_3
    #...Add code here
    order_6 = reader_1
    order_6 = reader_2
    order_6 = reader_3

    result = library.top_readers
  # Assert - chech execution result
    puts '*' * 100
    print 'TOP READER TEST: '
    puts result == [reader_1] ? "PASS" : 'FAIL'
end

check_top_reader
