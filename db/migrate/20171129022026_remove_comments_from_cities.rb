class RemoveCommentsFromCities < ActiveRecord::Migration[5.1]
  def change
    remove_column :cities, :comments, :text
  end
end
