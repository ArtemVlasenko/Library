class Animal
  def initialize(name)
    @name = name
  end

  def walk
    puts "walk"
  end

end

animal = Animal.new("cat")
animal.walk
