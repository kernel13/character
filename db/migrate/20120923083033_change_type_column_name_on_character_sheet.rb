class ChangeTypeColumnNameOnCharacterSheet < ActiveRecord::Migration
  def up
    rename_column :weapons, :type, :weapon_type
  end

  def down
        rename_column :weapons, :weapon_type, :type
  end
end
