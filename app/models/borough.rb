class Borough < ApplicationRecord
  has_many :neighborhoods
  has_many :person_neighborhoods, through: :neighborhoods
  has_many :people, through: :person_neighborhoods
end
