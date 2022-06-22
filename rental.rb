class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @person = person
    person.rents << self

    @book = book
    book.rents << self
  end
end
