class Rental
  def initialize(date)
    @date = date
  end

  attr_accessor :date
  attr_reader :book, :person

  def book=(book)
    @book = book
    book.rentals << self
  end

  def person=(person)
    @person = person
    person.rentals << self
  end
end
