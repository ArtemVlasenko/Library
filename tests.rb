def check_validation(title, expected_error_message, &block)
  print title
  block.call
  puts " -> FAIL!!"
rescue ValidationError => error
  result = error.message == expected_error_message
  puts result ? ' -> Pass' : ' -> FAIL!!!'
end

def run_validation_tests
  library = Library.new
  author = Author.new('10', '1')
  book = Book.new('1', '1')
  reader = Reader.new('name1', 'email1', 'city1', 'street1', 1)
  order = Order.new('0', '0')
  library.add_book(book)
  library.add_author(author)
  library.add_order(order)
  library.add_reader(reader)
  puts '**************************************'
  check_validation("Test validation for book title is nil", "title must be given") do
    Book.new(nil, 'author')
  end

  check_validation("Test validation for book title is String", "title must be string") do
    Book.new(Array.new, 'author')
  end

  check_validation("Test validation for book title is empty", "title must be not empty") do
    Book.new('', 'author')
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
  check_validation("Test validation for author biography is String", "biography must be string") do
    Author.new('name', Array.new)
  end

  check_validation("Test validation for author biography is empty", "biography must be not empty") do
    Author.new('name', '')
  end
  puts '*****************************************'

  puts '**************************************'
  check_validation("Test validation for order book is nil", "book must be given") do
    Order.new(nil, 'reader', date = Date.today)
  end

  check_validation("Test validation for order book instance of Book", "book must be an instance of Book") do
    Order.new('book', book)
  end
  puts '*****************************************'

  puts '**************************************'
  check_validation("Test validation for order reader is nil", "reader must be given") do
    Order.new('book', nil, date = Date.today)
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

  check_validation("Test validation for reader house is Integer", "house must be integer") do
    Reader.new('name', 'email', 'city', 'street', Array.new)
  end

  check_validation("Test validation for reader house is positive", "house must be positive") do
    Reader.new('name', 'email', 'city', 'street', 0)
  end
  puts '*****************************************'
end
