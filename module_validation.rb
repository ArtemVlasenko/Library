module Modulevalidation

  # def validate_string
  #   if !@name.is_a?(String)
  #     raise ValidationError, "name must be string"
  #   end
  # end

  # def validate_class
  #   if !@name.is_a?(klass)
  #     raise ValidationError, "name must be string"
  #   end
  # end

  def validate_book
    if @title.nil?
      raise ValidationError, "title must be given"
    elsif !@title.is_a?(String)
      raise ValidationError, "title must be string"
    elsif @title.empty?
      raise ValidationError, "title must be not empty"
    end
    if @author.nil?
      raise ValidationError, "author must be given"
    elsif @author.is_a?(Author)
      raise ValidationError, "author must be an instance of Author"
    end
  end

  def validate_autor
    if @name.nil?
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
    if @biography
      if !@biography.is_a?(String)
      raise ValidationError, "biography must be string"
      elsif @biography.empty?
        raise ValidationError, "biography must be not empty"
      end
    end
  end

  def validate_order
    if @book.nil?
      raise ValidationError, "book must be given"
    elsif @book.is_a?(Book)
      raise ValidationError, "book must be an instance of Book"
    end
    if @reader.nil?
      raise ValidationError, "reader must be given"
    elsif @reader.is_a?(Reader)
      raise ValidationError, "reader must be an instance of Reader"
    end
    if @date.nil?
      raise ValidationError, "date must be given"
    elsif !@date.is_a?(Date)
      raise ValidationError, "date must be an instance of Date"
    end
  end

  def validate_reader
    if @name.nil?
      raise ValidationError, "name must be given"
    elsif !@name.is_a?(String)
      raise ValidationError, "name must be string"
    elsif @name.empty?
      raise ValidationError, "name must be not empty"
    end
    if @email.nil?
      raise ValidationError, "email must be given"
    elsif !@email.is_a?(String)
      raise ValidationError, "email must be string"
    elsif @email.empty?
      raise ValidationError, "email must be not empty"
    end
    if @city.nil?
      raise ValidationError, "city must be given"
    elsif !@city.is_a?(String)
      raise ValidationError, "city must be string"
    elsif @city.empty?
      raise ValidationError, "city must be not empty"
    end
    if @street.nil?
      raise ValidationError, "street must be given"
    elsif !@street.is_a?(String)
      raise ValidationError, "street must be string"
    elsif @street.empty?
      raise ValidationError, "street must be not empty"
    end
    if @house.nil?
      raise ValidationError, "house must be given"
    elsif !@house.is_a?(Integer)
      raise ValidationError, "house must be integer"
    elsif !@house.positive?
      raise ValidationError, "house must be positive"
    end
  end
end
