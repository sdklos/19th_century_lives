class AddAbbreviationToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :abbreviation, :string
  end
end
