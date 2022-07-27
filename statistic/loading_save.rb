
# dump = Marshal.dump(myArray)
# File.write('./myarray', myArray, mode: 'r+b')
# dump = File.read('./myarray')
# user = Marshal.restore(dump)
module Uploader

  PATH = ''.freeze
  list = [Book, Reader, Author, Order, Date].freeze

  def load
    Marshal.load(File.read('list.dump'))
  end

  def open
    File.open('list.dump', 'w') { |f| f.write(Marshal.dump(list)) }
  end

end
# freeze -  Предотвращает дальнейшие модификации obj . При попытке модификации будет вызвана ошибка RuntimeError
