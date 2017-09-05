class Neighborhood < ApplicationRecord
  belongs_to :borough
  has_many :person_neighborhoods
  has_many :people, through: :person_neighborhoods
end
