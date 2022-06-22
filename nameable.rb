class Nameable
  def correct_name
    raise NotImplementedError("The subclass #{self.class} did not implemented #{__method__}...")
  end
end
