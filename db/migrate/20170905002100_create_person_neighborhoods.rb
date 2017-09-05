class CreatePersonNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    create_table :person_neighborhoods do |t|
      t.integer :person_id
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
