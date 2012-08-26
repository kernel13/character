class CreateCharacterSheets < ActiveRecord::Migration
  def change
    create_table :character_sheets do |t|
      t.string :name
      t.string :race
      t.string :deity
      t.string :gender
      t.float :height
      t.string :weight
      t.string :integer
      t.string :sizeCategory
      t.string :alignment
      t.string :master
      t.integer :age
      t.string :eyes
      t.string :hair
      t.string :skin
      t.integer :strengh                 
      t.integer :dexterity               
      t.integer :constitution            
      t.integer :intelligence            
      t.integer :wisdom                  
      t.integer :charisma                
      t.integer :temporarystrengh        
      t.integer :temporarydexterity      
      t.integer :temporaryconstitution   
      t.integer :temporaryintelligence   
      t.integer :temporarywisdom         
      t.integer :temporarycharisma       
      t.integer :wounds                  
      t.integer :nonelethal              
      t.integer :totalhp                 
      t.integer :totalac                 
      t.integer :armorbonus              
      t.integer :shieldbonus             
      t.integer :dextmodifier            
      t.integer :sizemodifier            
      t.integer :naturalarmor            
      t.integer :deflectionmodifier      
      t.integer :miscmodifier            
      t.integer :speed                   
      t.integer :touchac                 
      t.integer :flatfootedac            
      t.integer :totalinit               
      t.integer :miscinit                
        
      t.timestamps
    end
  end
end
