class HusbandWife < ApplicationRecord
  belongs_to :husband, inverse_of: :wives, class_name: 'Person', foreign_key: :husband_id, optional: true
  belongs_to :wife, inverse_of: :husbands, class_name: 'Person', foreign_key: :wife_id, optional: true
  belongs_to :person, class_name: 'Person', foreign_key: :person_id
end
