module ClassBook
  class Book
    include ModuleValidation
    attr_reader :title, :author

    def initialize(title, author)
      @title = title
      @author = author
      validate_book
    end

    def to_s
      "{ title: #{title}, author: #{author} }"
    end

    private

    def validate_book
      validate_presence(@title, "title must be given")
      validate_string(@title, "title must be string")
      validate_empty(@title, "title must be not empty")
      validate_presence(@author, "author must be given")
      validate_klass(@author, "author must be an instance of Author", Book)
    end
  end
end
