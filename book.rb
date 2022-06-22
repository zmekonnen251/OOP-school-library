require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_accessor :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def add_rental(date,book)
    Rental.new(date,self,person)
  end
end
