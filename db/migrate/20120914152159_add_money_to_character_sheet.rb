class AddMoneyToCharacterSheet < ActiveRecord::Migration
  def change
    add_column :character_sheets, :money, :text
  end
end
