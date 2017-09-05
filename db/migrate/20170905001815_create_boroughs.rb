class CreateBoroughs < ActiveRecord::Migration[5.1]
  def change
    create_table :boroughs do |t|
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
