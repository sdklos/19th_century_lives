class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :year_of_birth
      t.integer :year_of_death
      t.text :comments

      t.timestamps
    end
  end
end
