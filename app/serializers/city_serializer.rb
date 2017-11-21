class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :comments

  belongs_to :state
  has_many :people, serializer: AbbreviatedPersonSerializer
end
