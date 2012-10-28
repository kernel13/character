class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.string :name
      t.integer :character_sheet_id

      t.timestamps
    end
  end
end
