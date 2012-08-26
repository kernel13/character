class Ability < ActiveRecord::Base
  
    #relationship
    belongs_to :character_sheet
    belongs_to :skill
    
end
