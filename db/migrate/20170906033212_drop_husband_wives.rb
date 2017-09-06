class DropHusbandWives < ActiveRecord::Migration[5.1]
  def change
    drop_table :husband_wives
  end
end
