class AddParentIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :parent_id, :integer
    add_index :skills, :parent_id
  end
  
end
