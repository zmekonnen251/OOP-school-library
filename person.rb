class Person
  initialize(age,name="Unknown",parent_permission=true)
    @id
    @name = name
    parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age=age
  end

  def is_of_age?
    @age>=18
  end

  def can_use_services?
    is_of_age? || parent_permission
  end
  
  private :is_of_age
end