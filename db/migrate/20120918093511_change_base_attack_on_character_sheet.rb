class ChangeBaseAttackOnCharacterSheet < ActiveRecord::Migration
  def up
    remove_column :character_sheets, :base_attack
    add_column :character_sheets, :base_attack, :string
  end

  def down
    add_column :character_sheets, :base_attack, :integer
    remove_column :character_sheets, :base_attack
  end
end
