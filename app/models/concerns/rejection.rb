module Rejection

  def person_blank(attributes)
    attributes['name'].blank? || attributes['given_name'].blank?
  end

  def neighborhood_blank(attributes)
    attributes['name'].blank? || attributes['borough_id'].blank?
  end

  def person_not_unique(attributes)
    Person.all.each do |person|
      person.name == attributes['name'] && person.given_name = attributes['given_name']
    end
  end

  def neighborhood_not_unique(attributes)
    Neighborhood.all.each do |neighborhood|
      neighborhood.name == attributes['name']
    end
  end

  def reject_person(attributes)
    if self.person_not_unique(attributes) || self.person_blank(attributes)
      true
    else
      false
    end
  end

  def reject_neighborhood(attributes)
    neighborhood_not_unique(attributes) || neighborhood_blank(attributes)
  end
end
