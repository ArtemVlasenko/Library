require "json"
require "pry"

date = File.read('test.rb')
data_hesh = JSON.parse(date)
date.close

puts data_hesh['divide']

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
