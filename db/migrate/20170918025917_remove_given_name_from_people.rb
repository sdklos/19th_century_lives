class RemoveGivenNameFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :given_name, :string
  end
end
