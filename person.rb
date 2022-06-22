class Person
  attr_accessor :name
  attr_accessor :age
  attr_reader :id

  initialize(age,name="Unknown",parent_permission=true)
    @id = rand
    @name = name
    parent_permission = parent_permission
  end

  def is_of_age?
    @age>=18
  end

  def can_use_services?
    is_of_age? || parent_permission
  end
  
  private :is_of_age
end