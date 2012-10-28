class AddClassesToCharactersheets < ActiveRecord::Migration
  def change
    add_column :character_sheets, :classes, :string
  end
end
