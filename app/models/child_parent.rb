class ChildParent < ApplicationRecord
  belongs_to :parent, optional: true, class_name: 'Person', foreign_key: :parent_id
  belongs_to :child, optional: true, class_name: 'Person', foreign_key: :child_id
  belongs_to :person, optional: true, class_name: 'Person', foreign_key: :person_id
end
