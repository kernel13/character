class AddBaseAttackToCharacterSheet < ActiveRecord::Migration
  def change
      add_column :character_sheets, :base_attack, :integer
  end
end
