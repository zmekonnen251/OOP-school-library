require_relative 'person'

# Student class extends person class
class Student < Person
  def initialize(age, name, _parent, parent_permission, classroom)
    super(age, name, parent_permission)
    @class_room = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
