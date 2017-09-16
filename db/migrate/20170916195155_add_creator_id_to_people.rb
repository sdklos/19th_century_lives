class AddCreatorIdToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :creator_id, :integer
  end
end
