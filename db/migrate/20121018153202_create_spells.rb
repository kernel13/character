class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.integer :spells_known
      t.integer :spell_save
      t.integer :level
      t.integer :spells_per_day
      t.integer :bonus_spells
      t.integer :character_sheet_id
 
      t.timestamps
    end
  end
end
