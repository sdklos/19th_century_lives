class Marriage < ApplicationRecord
  belongs_to :spouse, optional: true, class_name: 'Person', foreign_key: :spouse_id
  belongs_to :person, optional: true, class_name: 'Person', foreign_key: :person_id



end
