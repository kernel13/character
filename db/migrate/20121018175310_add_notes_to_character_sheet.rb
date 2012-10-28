class AddNotesToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :notes, :text
  end
end
