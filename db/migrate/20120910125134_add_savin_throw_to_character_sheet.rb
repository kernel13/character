class AddSavinThrowToCharacterSheet < ActiveRecord::Migration
  def change
     add_column :character_sheets, :fortitudebasesavingthrow, :integer
     add_column :character_sheets, :fortitudemagicsavingthrow, :integer
     add_column :character_sheets, :fortitudemiscsavingthrow, :integer 
     add_column :character_sheets, :fortitudetempsavingthrow, :integer     
     
     add_column :character_sheets, :reflexbasesavingthrow, :integer
     add_column :character_sheets, :reflexmagicsavingthrow, :integer
     add_column :character_sheets, :reflexmiscsavingthrow, :integer 
     add_column :character_sheets, :reflextempsavingthrow, :integer
      
     add_column :character_sheets, :willbasesavingthrow, :integer
     add_column :character_sheets, :willmagicsavingthrow, :integer
     add_column :character_sheets, :willmiscsavingthrow, :integer 
     add_column :character_sheets, :willtempsavingthrow, :integer
  end
end
