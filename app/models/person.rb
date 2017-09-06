class Person < ApplicationRecord
  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_ids

  has_many :marriages, class_name: 'Marriage', foreign_key: :person_id
  has_many :spouses, through: :marriages, class_name: 'Person', foreign_key: :spouse_id

  has_many :person_neighborhoods
  has_many :neighborhoods, through: :person_neighborhoods
  has_many :boroughs, through: :neighborhoods

  def self.persist_marriage(first_spouse_id, second_spouse_id)
    a = Person.find(first_spouse_id)
    b = Person.find(second_spouse_id)
    a.spouses << b
    b.spouses << a
    a.save
    b.save
  end

  def self.persist_parenthood(parent_id, child_id)
    a = Person.find(parent_id)
    b = Person.find(child_id)
    a.children << b
    b.parents << a
    a.save
    b.save
  end
end
