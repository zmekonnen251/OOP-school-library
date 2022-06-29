require_relative 'person'
# Teacher class extends person class
class Teacher < Person
  def initialize(id, age, name, specialization)
    super(id, age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
