module Alphabetizable

  def alphabetize
    self.order(:name)
  end
end
