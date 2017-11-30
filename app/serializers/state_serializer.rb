class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation

  has_many :cities
  has_many :people
end
