class AddSpellResistToCharacterSheet < ActiveRecord::Migration
  def change
     add_column :character_sheets, :spell_resist, :integer
  end
end
