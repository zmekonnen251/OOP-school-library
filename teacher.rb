require_relative 'person'

class Teachear < Person
  def initialize(age,name,parent_permission,specialization)
    super(age,name,parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
