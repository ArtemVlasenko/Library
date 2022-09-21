require 'date'
require 'yaml'
require 'pry'
require_relative 'module_validation'
require_relative 'tests'
require_relative 'class_book'
require_relative 'class_author'
require_relative 'class_order'
require_relative 'class_reader'

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

include ClassBook
include ClassAuthor
include ClassOrder
include ClassReader

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
    @books << first_book = Book.new(title: "", author: "")
    # Add 3 reader to library
    #...Add code here
    @readers << first_reader = Reader.new(name: "", email: "", city: "", street: "", house: 1)
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
    # puts '*' * 100
    # print 'TOP READER TEST: '
    # puts result == [reader_1] ? "PASS" : 'FAIL'
end

check_top_reader
