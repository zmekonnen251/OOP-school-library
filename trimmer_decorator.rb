require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable_obj.correct_name
    name.length <= 10 ? name : name[0..9]
  end
end
