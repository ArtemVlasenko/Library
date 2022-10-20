  class Author
    include ModuleValidation
    attr_reader :name, :biography

    def initialize(name, biography)
      @name = name
      @biography = biography
      validate_autor
    end

    def to_s
      "{ name: #{name}, biography: #{biography} }"
    end

    private

    def validate_autor
      validate_presence(@name, "name must be given")
      validate_klass(@name, "name must be string", String)
      validate_empty(@name, "name must be not empty")
      validate_klass(@biography, "biography must be string", String)
      validate_empty(@biography, "biography must be not empty")
    end
  end
