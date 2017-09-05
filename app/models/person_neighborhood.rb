class PersonNeighborhood < ApplicationRecord
  belongs_to :person
  belongs_to :neighborhood
  
end
