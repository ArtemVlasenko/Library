module ClassReader
  class Reader
    include ModuleValidation
    attr_reader :name, :email, :city, :street, :house

    def initialize(name, email, city, street, house)
      @name = name
      @email = email
      @city = city
      @street = street
      @house = house
      validate_reader
    end

    def to_s
      "{ name: #{name}, email: #{email}, city: #{city}, street: #{street}, house: #{house} }"
    end

    private

    def validate_reader
      validate_presence(@name, "name must be given")
      validate_string(@name, "name must be string")
      validate_empty(@name, "name must be not empty")
      validate_presence(@email, "email must be given")
      validate_string(@email, "email must be string")
      validate_empty(@email, "email must be not empty")
      validate_presence(@city, "city must be given")
      validate_string(@city, "city must be string")
      validate_empty(@city, "city must be not empty")
      validate_presence(@street, "street must be given")
      validate_string(@street,"street must be string")
      validate_empty(@street, "street must be not empty")
      validate_presence(@house, "house must be given")
      if !@house.is_a?(Integer)
        raise ValidationError, "house must be integer"
      elsif !@house.positive?
        raise ValidationError, "house must be positive"
      end
    end
  end
end
