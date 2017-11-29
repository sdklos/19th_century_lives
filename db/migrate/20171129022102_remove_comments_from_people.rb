class RemoveCommentsFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :comments, :text
  end
end
