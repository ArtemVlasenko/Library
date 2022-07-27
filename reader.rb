class Reader

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate(name: name, email: email, city: city, street: street, house: house)
  end

  # def marshal_dump
  #   [@name, @version]
  # end

  private

  def validate
    validate_name
  end

  def validate_name
    if @name.nil?
      raise ArgumentError, "the name must be given"
    elsif !@name.is_a?(String)
      raise ArgumentError, "the name must be string"
    elsif @name.empty?
      raise ArgumentError, "the name must be not empty"
    end


  end

  # def validate(name:, email:, city:, street:, house:)
  #   check_class(name, String)
  #   check_string_for_empty(name)
  #   check_class(email, String)
  #   check_string_for_empty(email)
  #   check_class(city, String)
  #   check_string_for_empty(city)
  #   check_class(street, String)
  #   check_string_for_empty(street)
  #   check_class(house, Integer)
  # end

end
