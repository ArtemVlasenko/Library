module ModuleValidation
  def validate_presence(value, error_message)
    return if !value.nil?

    raise ValidationError, error_message
  end

  def validate_empty(value, error_message)
    return if !value.empty?

    raise ValidationError, error_message
  end

  def validate_klass(value, error_message, klass)
    return if value.is_a?(klass)

    raise ValidationError, error_message
  end

  def validate_positive(value, error_message)
    return if value.positive?

    raise ValidationError, error_message
  end
end
