class AddGivenNameToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :given_name, :string
  end
end
