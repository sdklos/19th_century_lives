class CreatePersonCities < ActiveRecord::Migration[5.1]
  def change
    create_table :person_cities do |t|
      t.integer :person_id
      t.integer :city_id

      t.timestamps
    end
  end
end
