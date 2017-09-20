class Person < ApplicationRecord
  extend Alphabetizable

  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_id

  has_many :marriages, class_name: 'Marriage', foreign_key: :person_id
  has_many :spouses, through: :marriages, class_name: 'Person', foreign_key: :spouse_id

  has_many :person_neighborhoods
  has_many :neighborhoods, through: :person_neighborhoods
  has_many :boroughs, through: :neighborhoods

  belongs_to :user, optional: true, foreign_key: :creator_id

  accepts_nested_attributes_for :parents, reject_if: :reject_relationships
  accepts_nested_attributes_for :spouses, reject_if: :reject_relationships
  accepts_nested_attributes_for :children, reject_if: :reject_relationships
  accepts_nested_attributes_for :neighborhoods, reject_if: :reject_relationships
  accepts_nested_attributes_for :neighborhoods, reject_if: :reject_neighborhoods

  validates :name, :given_name, presence: true


  def reject_neighborhoods(attributes)
    attributes['name'].blank? || attributes['borough_id'].blank?
  end

  def reject_relationships(attributes)
    attributes['name'].blank? || attributes['given_name'].blank?
  end


  def self.persist_marriage(first_spouse_id, second_spouse_id)
    a = Person.find(first_spouse_id)
    b = Person.find(second_spouse_id)
    a.spouses << b
    b.spouses << a
    a.save
    b.save
  end

  def self.persist_parenthood(child_id, parent_id)
    a = Person.find(child_id)
    b = Person.find(first_parent_id)
    a.parents << b
    b.children << a
    a.save
    b.save
  end

  def siblings
    siblings = []
    if self.parents
      a = self.parents.map {|parent| parent.id}
      Person.all.each do |person|
        person.parents.each do |parent|
          if a.include?(parent.id) && person != self
            siblings << person
          end
        end
      end
    end
    siblings.uniq!
  end

  def grandparents
    grandparents = []
    if self.parents
      self.parents.each do |parent|
        parent.parents.each do |grandparent|
          grandparents << grandparent
        end
      end
    end
    grandparents
  end

  def aunts_and_uncles
    aunts_and_uncles = []
    if self.parents
      self.parents.each do |parent|
        if parent.siblings
          parent.siblings.each do |sibling|
            aunts_and_uncles << sibling
          end
        end
      end
    end
    aunts_and_uncles
  end

  def nephews_and_nieces
    nephews_and_nieces = []
    if self.siblings
      self.siblings.each do |sibling|
        sibling.children.each do |child|
          nephews_and_nieces << child
        end
      end
    end
    nephews_and_nieces
  end

  def cousins
    cousins = []
    if self.aunts_and_uncles
      self.aunts_and_uncles.each do |aunt_uncle|
        aunt_uncle.children.each do |cousin|
          cousins << cousin
        end
      end
    end
    cousins
  end

  def display
    "#{self.name}, #{self.given_name}"
  end


end
