class AddMagicToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :divine_domain_name1, :string
    add_column :character_sheets, :divine_granted_power1, :string
    add_column :character_sheets, :divine_domain_name2, :string
    add_column :character_sheets, :divine_granted_power2, :string
    
    add_column :character_sheets, :arcane_speciality_school, :string
    add_column :character_sheets, :arcane_prohibited_school1, :string
    add_column :character_sheets, :arcane_prohibited_school2, :string    
    add_column :character_sheets, :arcane_spell_failure, :string
    
    add_column :character_sheets, :psi_powers_known, :interger
    add_column :character_sheets, :psi_max_level, :integer
    add_column :character_sheets, :psi_primary_dicipline, :string
    add_column :character_sheets, :psi_power_points_per_day, :interger
    
    add_column :character_sheets, :turn_undead_times_per_day, :integer
    add_column :character_sheets, :turn_undead_check, :integer
    add_column :character_sheets, :turn_undead_damage, :integer
  end
end
