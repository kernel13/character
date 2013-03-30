ActiveAdmin.register User do
  index do
     column :id
     column :email
     column :current_sign_in_at
     column :current_sign_in_ip
     column :last_sign_in_at
     column :last_sign_in_ip
     
     default_actions
  end
  
  show do |user|
    columns do
      column do
        attributes_table do
           row :id
           row :email
           row :current_sign_in_at
           row :last_sign_in_at
           row :created_at
           row :updated_at   
         end
 
    end
    column do
      panel "Characters" do
         table_for(user.character_sheets) do
           column("name")
           column("classes")
         end
      end
    end
    end
  end
end
