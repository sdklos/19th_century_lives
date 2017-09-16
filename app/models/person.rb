class Person < ApplicationRecord
  has_many :child_parents, class_name: 'ChildParent', foreign_key: :person_id
  has_many :parents, through: :child_parents, class_name: 'Person', foreign_key: :child_id
  has_many :children, through: :child_parents, class_name: 'Person', foreign_key: :parent_ids

  has_many :marriages, class_name: 'Marriage', foreign_key: :person_id
  has_many :spouses, through: :marriages, class_name: 'Person', foreign_key: :spouse_id

  has_many :person_neighborhoods
  has_many :neighborhoods, through: :person_neighborhoods
  has_many :boroughs, through: :neighborhoods

  belongs_to :user, foreign_key: :creator_id

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
    a = self.parents.map {|parent| parent.id}
    Person.all.each do |person|
      person.parents.each do |parent|
        if a.include?(parent.id) && person != self
          siblings << person
        end
      end
    end
    siblings.uniq!
  end

  def grandparents
    grandparents = []
    self.parents.each do |parent|
      parent.parents.each do |grandparent|
        grandparents << grandparent
      end
    end
    grandparents
  end

  def aunts_and_uncles
    aunts_and_uncles = []
    self.parents.each do |parent|
      parent.siblings.each do |sibling|
        aunts_and_uncles << sibling
      end
    end
    aunts_and_uncles
  end

  def nephews_and_nieces
    nephews_and_nieces = []
    self.siblings.each do |sibling|
      sibling.children.each do |child|
        nephews_and_nieces << child
      end
    end
    nephews_and_nieces
  end

  def cousins
    cousins = []
    self.aunts_and_uncles.each do |aunt_uncle|
      aunt_uncle.children.each do |cousin|
        cousins << cousin
      end
    end
    cousins
  end
end
