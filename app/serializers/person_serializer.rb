class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :given_name, :year_of_birth, :year_of_death, :creator_id
  has_many :children
  has_many :parents
  has_many :spouses

  has_many :cities
  has_many :states
end
