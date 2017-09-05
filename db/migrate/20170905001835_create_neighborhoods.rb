class CreateNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :comments
      t.integer :borough_id

      t.timestamps
    end
  end
end
