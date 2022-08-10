require "pry"

class Divider
  def initialize(first, second)
    @first = first
    @second = second
    validate_second
  end

  def divide
    @first / @second
  rescue ZeroDivisionError => e
    "second argument must not be zero"
  end

  private

  def validate_second
    if @second == 0
      raise ValidationError, "second argument must not be zero"
    end
  end
end

class ValidationError < StandardError
end

divider = Divider.new(4, 0)
# begin
  # puts divider.divide
# rescue ZeroDivisionError => e
#   puts "second argument must not be zero"
# end
puts divider.divide
