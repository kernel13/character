class Ability < ActiveRecord::Base
    
    #relationship
    belongs_to :character_sheet
    belongs_to :skill

    #Attributes accessor
    attr_accessible :skill_id, :skill_class, :ranks, :misc

    attr_accessor    :name
    attr_accessor    :characteristic
    attr_accessor    :characteristic_short
    attr_accessor    :bonus 
    attr_accessor    :skill_modifier 
    
    attr_accessible  :name
    attr_accessible  :characteristic
    attr_accessible  :characteristic_short
    attr_accessible  :bonus 
    attr_accessible  :skill_modifier
    
    #Virtual attribute
    def name
      self.skill.name
    end
    
    def characteristic
      self.skill.characteristic
    end
    
    def characteristic_short
      self.skill.characteristic[0..2].upcase
    end
    
    def bonus  
      if self.ranks or self.misc
          #self.character_sheet.get_bonus(characteristic) 
          case characteristic
          when "strengh"
             self.character_sheet.strength_bonus
          when "dexterity"
             self.character_sheet.dexterity_bonus
          when "constitution"
             self.character_sheet.constitution_bonus
          when "intelligence"
             self.character_sheet.intelligence_bonus
          when "wisdom"
             self.character_sheet.wisdom_bonus
          when "charisma"                        
             self.character_sheet.charisma_bonus
          end      
      end
    end
    
    def skill_modifier
     value =  self.ranks.to_i + self.misc.to_i + self.bonus.to_i if self.ranks or self.misc
    end
  
     def children?
         self.skill.children?
    end
        
    def children
        self.skill.children.collect {|s| [ s.name, s.id ] } if self.skill
    end
  
    def parent_children
      self.skill.parent.children.collect {|s| [s.name, s.id] } if self.skill
    end
    
    private
  
end
