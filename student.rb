require_relative 'person'

# Student class extends person class
class Student < Person
  attr_reader :classroom

  def initialize(age, name, _parent, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
