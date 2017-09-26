class Marriage < ApplicationRecord
  belongs_to :spouse, inverse_of: :marriages, optional: true, class_name: 'Person', foreign_key: :spouse_id
  belongs_to :person, inverse_of: :marriages, optional: true, class_name: 'Person', foreign_key: :person_id
end
