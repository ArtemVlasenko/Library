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
      validate_klass(@name, "name must be string", String)
      validate_empty(@name, "name must be not empty")
      validate_presence(@email, "email must be given")
      validate_klass(@email, "email must be string", String)
      validate_empty(@email, "email must be not empty")
      validate_presence(@city, "city must be given")
      validate_klass(@city, "city must be string", String)
      validate_empty(@city, "city must be not empty")
      validate_presence(@street, "street must be given")
      validate_klass(@street,"street must be string", String)
      validate_empty(@street, "street must be not empty")
      validate_presence(@house, "house must be given")
      validate_klass(@house,"house must be integer", Integer)
      validate_positive(@house, "house must be positive")
      # if !@house.positive?
      #   raise ValidationError, "house must be positive"
      # end
    end
  end
