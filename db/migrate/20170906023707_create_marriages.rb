class CreateMarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :marriages do |t|
      t.integer :person_id
      t.integer :spouse_id

      t.timestamps
    end
  end
end
