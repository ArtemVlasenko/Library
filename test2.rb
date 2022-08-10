require "yaml"

class Car
  def initialize(model, speed)
    @model = model
    @speed = speed
  end

  # Десереализуем в объект
  def self.deserialize(yaml_string)
    YAML::load(yaml_string)
  end

  # Объект сериализуем
  def serialize
    YAML::dump(self)
  end

  def to_s
    "Car: [model = #{@model}, speed = #{@speed}]"
  end
end

audi = Car.new('Audi', 400)
yaml = audi.serialize
puts "yaml выглядит так:"
p yaml
puts "Yaml можно обратно преобразовать в объект\n: #{Car.deserialize(yaml)}"
puts

bmw = Car.new('BMW', 600)
mazda = Car.new('Mazda', 120)
cars = [bmw, mazda]

puts "Мы можем даже сериализовать массивы: #{cars}"
