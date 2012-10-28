class AddExperienceToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :experience, :integer
  end
end
