class ChildParent < ApplicationRecord
  belongs_to :parent, inverse_of: :children, class_name: 'Person', foreign_key: :parent_id
  belongs_to :child, inverse_of: :parents, class_name: 'Person', foreign_key: :child_id
  belongs_to :person, class_name: 'Person', foreign_key: :person_id
end
