require 'pry'

class Person < ApplicationRecord
  include Relationships
  include PersonDisplay::InstanceMethods
  extend PersonDisplay::ClassMethods
  extend Validation

  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_id

  has_many :marriages, class_name: 'Marriage', foreign_key: :person_id
  has_many :spouses, through: :marriages, class_name: 'Person', foreign_key: :spouse_id

  has_many :person_cities
  has_many :cities, through: :person_cities
  has_many :states, through: :cities

  belongs_to :user, optional: true, foreign_key: :creator_id

  validates :name, :given_name, presence: true
  validates_uniqueness_of :given_name, :scope => [:name, :year_of_birth, :year_of_death ]
  validates :year_of_birth, allow_blank: true, numericality: {
                                             only_integer: true,
                                             greater_than_or_equal_to: 1400,
                                             less_than_or_equal_to: Date.today.year
                                           }
  validates :year_of_death, allow_blank: true, numericality: {
                                             only_integer: true,
                                             greater_than_or_equal_to: 1400,
                                             less_than_or_equal_to: Date.today.year
                                           }


   accepts_nested_attributes_for :parents, :spouses, :children, :reject_if => :reject_person_attributes?

   accepts_nested_attributes_for :cities, :reject_if => :reject_city_attributes?

  def reject_person_attributes?(attributes)
    !Person.attributes_are_valid?(attributes)
  end

  def reject_city_attributes?(attributes)
    !City.attributes_are_valid?(attributes)
  end

  # def parents_attributes=(parents_attributes)
  #   parents_attributes.each do |i, parent_attributes|
  #       parent = Person.find_or_initialize_by(parent_attributes)
  #     if parent.save
  #       self.parents << parent
  #     end
  #   end
  # end

#   def spouses_attributes=(spouses_attributes)
#     spouses_attributes.each do |i, spouse_attributes|
#       spouse = Person.find_or_initialize_by(spouse_attributes)
#       if spouse.save
#         self.spouses << spouse
#       end
#     end
#   end
#
#   def children_attributes=(children_attributes)
#     children_attributes.each do |i, child_attributes|
#        child = Person.find_or_initialize_by(child_attributes)
#        if child.save
#          self.children << child
#       end
#     end
#   end
#
#   def cities_attributes=(cities_attributes)
#     cities_attributes.each do |i, city_attributes|
#       city = City.find_or_create_by(city_attributes)
#       if city.save
#         self.cities << city
#       end
#     end
#   end
#
 end
