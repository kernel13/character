class CreateSpecialAbilities < ActiveRecord::Migration
  def change
    create_table :special_abilities do |t|
      t.string :name
      t.integer :character_sheet_id

      t.timestamps
    end
  end
end
