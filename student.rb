require_relative 'person'

class Student < Person
  def initialize(age,name,parent,parent_permission,classroom)
    super(age,name,parent_permission)
    @class_room = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end


