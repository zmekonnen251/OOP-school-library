require_relative 'nameable'
require_relative 'rental'

# Person Class
class Person < Nameable
  attr_accessor :name, :age, :rents
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
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
