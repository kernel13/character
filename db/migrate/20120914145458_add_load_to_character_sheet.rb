class AddLoadToCharacterSheet < ActiveRecord::Migration
  def change
      add_column :character_sheets, :light_load, :integer
      add_column :character_sheets, :medium_load, :integer
      add_column :character_sheets, :heavy_load, :integer
      add_column :character_sheets, :lift_over_head, :integer
      add_column :character_sheets, :lift_off_ground, :integer                      
      add_column :character_sheets, :push_or_drag, :integer
  end
end
