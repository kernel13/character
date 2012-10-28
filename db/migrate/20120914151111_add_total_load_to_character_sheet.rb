class AddTotalLoadToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :total_load, :integer
  end
end
