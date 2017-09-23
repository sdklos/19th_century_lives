module Display
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
  end
end
