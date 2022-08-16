require "json"
require "pry"

# date = File.read('test.rb')
# data_hesh = JSON.parse(date)
# date.close

#  puts data_hesh['divide']

# require 'yaml'
# # config = YAML.load_file('data.yml')


# # Десереализуем в объект
#  def self.deserialize(yaml_string)
#   YAML::load(yaml_string)
# end

# # Объект сериализуем
# def serialize
#   YAML::dump(self)
# end

# ---------------------------
def save_to_file
  a = File.readlines(  'library.rb', 'w')
  a.map! {|i| i.chomp}
   a.map! {|i| i.split(":")}
   File.write("to_s.txt")
  puts a
  end
  save_to_file



# def save_to_file
# a = File.readlines( @first.to_s 'test.rb', 'w')
# a.map! {|i| i.chomp}
#  a.map! {|i| i.split(":")}
# puts a
# end
# save_to_file

# -----------------------------
# File.open("#{@first}_Divider.txt") do |a|
#   puts a.write()
# end
