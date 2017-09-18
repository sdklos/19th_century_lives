class Neighborhood < ApplicationRecord
  extend Alphabetizable

  belongs_to :borough, optional: true
  has_many :person_neighborhoods
  has_many :people, through: :person_neighborhoods

  def display
    "#{self.name} (#{self.borough.name})"
  end
end
