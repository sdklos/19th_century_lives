class Borough < ApplicationRecord
  extend Alphabetizable

  has_many :neighborhoods
  has_many :person_neighborhoods, through: :neighborhoods
  has_many :people, through: :person_neighborhoods

  validates :name, presence: true

  def display
    "#{self.name}"
  end
end
