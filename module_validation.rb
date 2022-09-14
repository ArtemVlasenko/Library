module Modulevalidation
  def validate_presence(value, error_message)
    return if !value.nil?

    raise ValidationError, error_message
  end
end
