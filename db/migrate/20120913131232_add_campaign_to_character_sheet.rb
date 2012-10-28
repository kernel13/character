class AddCampaignToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :campaign, :string
  end
end
