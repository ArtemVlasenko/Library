# class Factory
#   attr_accessor :name, :weight

#   def initialize(name, weight)
#     @name = name
#     @weight = weight
#   end
# end

# animal = Factory.new("tim", 230)
# puts animal.name, animal.weight

# Animal = Struct.new(:name, :weight)
# animal = Animal.new('vadim', 70)
# puts animal.name, animal.weight

class Person

  Address = Struct.new(:street_1, :street_2, :city, :province, :country, :postal_code)

  attr_accessor :name, :address

  def initialize(name, opts)
    @name = name
    @address = Address.new(opts[:street_1], opts[:street_2], opts[:city], opts[:province], opts[:country], opts[:postal_code])
  end

end

leigh = Person.new("Leigh Halliday", {
  street_1: "123 Road",
  city: "Toronto",
  province: "Ontario",
  country: "Canada",
  postal_code: "M5E 0A3"
})

puts leigh.name, leigh.address
