module PersonDisplay
  module ClassMethods
    def alphabetize
      self.order(:name, :given_name)
    end
  end

  module InstanceMethods
    def display
      "#{self.name}, #{self.given_name}"
    end

    def title_display
      "#{self.given_name} #{self.name}"
    end

    def spouses_for_display
      spouses_for_display = []
      safe_array = self.spouses
      spouses_for_display = safe_array.reject{|s| s == self}
    end
  end
end
