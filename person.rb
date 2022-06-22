# frozen_string_literal: true

# Person Class
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(_age, name = 'Unknown', parent_permission: true)
    @id = rand
    @name = name
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || parent_permission
  end

  private :is_of_age
end
