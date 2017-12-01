class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation

  has_many :cities

end
