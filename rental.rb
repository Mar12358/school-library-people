class Rental
  def initialize(date, book = nil, person = nil)
    @date = date
    self.book = book if book
    self.person = person if person
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
