require_relative 'person'
# Teacher class extends person class
class Teachear < Person
  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
