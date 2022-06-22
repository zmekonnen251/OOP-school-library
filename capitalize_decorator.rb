require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable_obj.correct_name.capitalize
  end
end
