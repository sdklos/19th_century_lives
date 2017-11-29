class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :given_name, :year_of_birth, :year_of_death, :creator_id
  has_many :children, serializer: AbbreviatedPersonSerializer
  has_many :parents, serializer: AbbreviatedPersonSerializer
  has_many :spouses, serializer: AbbreviatedPersonSerializer

  has_many :cities
  has_many :states
end
