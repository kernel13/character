class AddGrappleToCharacterSheet < ActiveRecord::Migration
  def change
      add_column :character_sheets, :grapplemisc, :integer
  end
end
