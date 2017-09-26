class AddUniquenessConstraintToPerson < ActiveRecord::Migration[5.1]
  def change
    add_index :people, [:name, :given_name, :year_of_birth, :year_of_death], :unique => true, :name => 'unique_index'
  end
end
