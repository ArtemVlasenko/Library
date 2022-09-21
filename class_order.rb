module ClassOrder
  class Order
    include ModuleValidation
    attr_reader :book, :reader, :date

    def initialize(book, reader, date = Date.today)
      @book = book
      @reader = reader
      @date = date
      validate_order
    end

    def to_s
      "{ book: #{book}, reader: #{reader}, date: #{date} }"
    end

    private

    def validate_order
      validate_presence(@book, "book must be given")
      validate_klass(@book, "book must be an instance of Book", Order)
      validate_presence(@reader, "reader must be given")
      validate_klass(@reader, "reader must be an instance of Reader", Order)
      validate_presence(@date, "date must be given")
      if !@date.is_a?(Date)
        raise ValidationError, "date must be an instance of Date"
      end
    end
  end
end
