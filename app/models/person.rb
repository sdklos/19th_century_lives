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
  validates_uniqueness_of :given_name, :scope => [:name]
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


  def reject_person_attributes?(attributes)
    !Person.attributes_are_valid?(attributes)
  end

  def reject_city_attributes?(attributes)
    !City.attributes_are_valid?(attributes)
  end

  def cities_attributes=(cities_attributes)
    cities_attributes.each do |i, city_attributes|
      city = City.find_or_create_by(city_attributes)
      if city.save
        self.cities << city
      end
    end
  end

 end
