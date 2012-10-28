class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :attack
      t.integer :bonus
      t.string :dammage
      t.string :critical
      t.string :range
      t.string :type
      t.string :notes
      t.integer :character_sheet_id
      
      t.timestamps
    end
  end
end
