require_relative "author"
require_relative "book"
require_relative "order"
require_relative "reader"

Dir["*.rb"].each { |file| require_relative file}
