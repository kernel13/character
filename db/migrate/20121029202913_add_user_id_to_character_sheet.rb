class AddUserIdToCharacterSheet < ActiveRecord::Migration
  def change
      add_column :character_sheets, :user_id, :integer
  end
end
