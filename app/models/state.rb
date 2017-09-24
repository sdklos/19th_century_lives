class State < ApplicationRecord

  has_many :cities
  has_many :person_cities, through: :cities
  has_many :people, through: :person_cities

  validates :name, presence: true

  def display
    "#{self.name}"
  end

  def self.alphabetize
    self.order(:abbreviation)
  end
end
