require_relative 'person'

# Student class extends person class
class Student < Person
  attr_reader :classroom

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
