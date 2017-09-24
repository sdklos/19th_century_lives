class PersonCity < ApplicationRecord
  belongs_to :person
  belongs_to :city
end
