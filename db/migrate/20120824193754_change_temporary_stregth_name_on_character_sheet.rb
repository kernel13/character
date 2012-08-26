class ChangeTemporaryStregthNameOnCharacterSheet < ActiveRecord::Migration
  def up
    rename_column :character_sheets, :temporarystrengh, :temporarystrength
  end

  def down
    rename_column :character_sheets, :temporarystrength, :temporarystrengh
  end
end
