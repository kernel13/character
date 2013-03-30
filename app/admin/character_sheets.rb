ActiveAdmin.register CharacterSheet do 
  filter :name
  
  index do
    column :name
    column :race
    column :classes
  end
end
