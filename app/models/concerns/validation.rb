module Validation

  def attributes_are_valid?(attributes)
    object = self.new(attributes)
    object.valid?
  end

end
