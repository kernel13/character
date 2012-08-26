class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.integer :character_sheet_id
      t.integer :skill_id
      t.integer :ranks
      t.integer :misc
      t.boolean :skill_class

      t.timestamps
    end
  end
end
