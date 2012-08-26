class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :characteristic
      t.boolean :native
      t.integer :synergy
      
      t.timestamps
    end
  end
end
