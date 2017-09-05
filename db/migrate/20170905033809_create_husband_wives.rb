class CreateHusbandWives < ActiveRecord::Migration[5.1]
  def change
    create_table :husband_wives do |t|
      t.integer :person_id
      t.integer :husband_id
      t.integer :wife_id

      t.timestamps
    end
  end
end
