class ChangeAttributeNameOnCharacterSheet < ActiveRecord::Migration
  def up
    rename_column :character_sheets, :strengh, :strength
  end

  def down
        rename_column :character_sheets, :strength, :strengh
  end
end
