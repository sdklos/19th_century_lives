module Alphebatizable

  def alphabetize
    self.order(:name)
  end
end
