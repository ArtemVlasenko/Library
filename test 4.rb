
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
#   puts "Test validation for author biography is nil"
#   Author.new('name', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "biography must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for author biography is String"
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
#   Order.new(nil, 'reader', date = Date.today)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "book must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order book instance of Book"
#   Order.new(book, 'reader')
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
#   Order.new('book', 'reader', nil)
#   puts "FAIL"
# rescue ValidationError => error
#   result = error.message ==  "date must be given"
#   puts result ? 'PASS' : 'FAIL'

#   puts '*****************************************'
# end

# begin
#   puts '**************************************'
#   puts "Test validation for order date instance of Date"
#   Order.new('book', 'reader', Date)
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

# ********************************************

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
