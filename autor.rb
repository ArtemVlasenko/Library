class Autor

  def initialize(name, biography)
    @name = name
    @biography = biography

    validates :name, :biography, presence: true, length: {minimum: 5}
  end



  # def marshal_dump
  #   [@name, @biography]
  # end

  # def marshal_load array
  #   @name, @biography = array
  # end



  def validate_name
    if @name.nil?
      raise ArgumentError, "the name must be given"
    elsif !@name.is_a?(String)
      raise ArgumentError, "the name must be string"
    elsif @name.empty?
      raise ArgumentError, "the name must be not empty"
    end

  end

  def validate(name, biography)
    check_class(name, String)
    check_string_for_empty(name)
    check_class(biography, String)
  end

end




























# presence: проверка будет вызыватся автоматически
