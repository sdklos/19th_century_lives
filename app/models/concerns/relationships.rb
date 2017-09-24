module Relationships

  def build_associations
    self.parents.build
    self.parents.build
    self.children.build
    self.spouses.build
    self.neighborhoods.build
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

  def grandchildren
    grandchildren = []
    if self.children
      self.children.each do |child|
        child.children.each do |grandchild|
          grandchildren << grandchild
        end
      end
    end
    grandchildren
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
end
