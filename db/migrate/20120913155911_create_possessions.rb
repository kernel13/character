class CreatePossessions < ActiveRecord::Migration
  def change
    create_table :possessions do |t|
      t.string :item
      t.integer :weight
      t.integer :character_sheet_id
      
      t.timestamps
    end
  end
end
