class Person < ApplicationRecord
  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_id

  has_many :husband_wives, class_name: 'HusbandWife', foreign_key: :person_id
  has_many :husbands, through: :husband_wives, class_name: 'Person', foreign_key: :wife_id
  has_many :wives, through: :husband_wives, class_name: 'Person', foreign_key: :husband_id

  has_many :person_neighborhoods
  has_many :neighborhoods, through: :person_neighborhoods
  has_many :boroughs, through: :neighborhoods
end
