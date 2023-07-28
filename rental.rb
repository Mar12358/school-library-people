class Rental
  def initialize(date)
    @date = date
  end
  attr_accessor :date
  attr_reader :book

  def book=(book)
    @book = book
    book.rentals << self
  end
end
