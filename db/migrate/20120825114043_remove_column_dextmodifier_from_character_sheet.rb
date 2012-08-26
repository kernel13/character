class RemoveColumnDextmodifierFromCharacterSheet < ActiveRecord::Migration
  def up
    remove_column :character_sheets, :dextmodifier
  end

  def down
    add_column :character_sheets, :dextmodifier
  end
end
