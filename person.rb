require_relative 'nameable'
require_relative 'rental'

# Person Class
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(_age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand
    @name = name
    @parent_permission = parent_permission
    @rents = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || parent_permission
  end

  private :of_age?
end
