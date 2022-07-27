require_relative "boot"

begin
  a = Author.new("neim", "author")
rescue ArgumentError => error
  puts "error: #{error.messege }"
  puts "Exception Class: #{ e.class.name }"
  puts "Exception Message: #{ e.message }"
  puts "Exception Backtrace: #{ e.backtrace }"
end

puts a
