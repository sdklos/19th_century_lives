class Person < ApplicationRecord
  include Relationships
  include Display::InstanceMethods
  extend Display::ClassMethods

  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_id

  has_many :marriages, class_name: 'Marriage', foreign_key: :person_id
  has_many :spouses, through: :marriages, class_name: 'Person', foreign_key: :spouse_id

  has_many :person_neighborhoods
  has_many :neighborhoods, through: :person_neighborhoods
  has_many :boroughs, through: :neighborhoods

  belongs_to :user, optional: true, foreign_key: :creator_id

  validates :name, :given_name, presence: true
  validates :given_name, uniqueness: { scope: :name }

  def parents_attributes=(parents_attributes)
    parents_attributes.each do |i, parent_attributes|
      parent = Person.find_or_initialize_by(parent_attributes)
      if parent.save
        self.parents << parent
      end
    end
  end

  def spouses_attributes=(spouses_attributes)
    spouses_attributes.each do |i, spouse_attributes|
      spouse = Person.find_or_initialize_by(spouse_attributes)
      if spouse.save
        self.spouses << spouse
      end
    end
  end

  def children_attributes=(children_attributes)
    children_attributes.each do |i, child_attributes|
       child = Person.find_or_initialize_by(child_attributes)
       if child.save
         self.children << child
      end
    end
  end

  def neighborhoods_attributes=(neighborhoods_attributes)
    neighborhoods_attributes.each do |i, neighborhood_attributes|
      neighborhood = Neighborhood.find_or_create_by(neighborhood_attributes)
      if neighborhood.save
        self.neighborhoods << neighborhood
      end
    end
  end

end
