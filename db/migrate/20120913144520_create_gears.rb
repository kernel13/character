class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :protective_item
      t.string :type
      t.integer :ac_bonus
      t.integer :max_dex
      t.integer :check_penalty
      t.integer :spell_failure
      t.integer :speed
      t.integer :weight
      t.string :special_properties
      t.string :category
      t.integer :character_sheet_id
      
      t.timestamps
    end
  end
end
