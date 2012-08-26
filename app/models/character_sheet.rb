class CharacterSheet < ActiveRecord::Base
    
    #relationship
    has_many :abilities
    has_many :skills, :through => :abilities
    
    # => Validation
    validates :name, :presence => true
    validates :height, :weight, :age, :numericality => true, :allow_nil => true
    validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :numericality => true, :allow_nil => true
    validates :temporarystrength, :temporarydexterity, :temporaryconstitution, :temporaryintelligence, :temporarywisdom, :temporarycharisma, :numericality => true, :allow_nil => true
    validates  :wounds, :nonelethal, :totalhp, :totalac, :numericality => true, :allow_nil => true
    validates :armorbonus, :shieldbonus, :sizemodifier, :naturalarmor, :deflectionmodifier, :miscmodifier, :numericality => true, :allow_nil => true
    validates :touchac, :flatfootedac, :totalinit, :miscinit, :numericality => true, :allow_nil => true
    validates :speed, :numericality => true, :allow_nil => true
    
    # = Accessor
    attr_accessible :name, :race, :deity, :gender, :height, :weight, :sizeCategory, :alignment, :master, :age, :eyes, :hair, :skin
    attr_accessible :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
    attr_accessible :temporarystrength, :temporarydexterity, :temporaryconstitution, :temporaryintelligence, :temporarywisdom, :temporarycharisma      
    attr_accessible :wounds, :nonelethal, :totalhp, :totalac 
    attr_accessible :armorbonus, :shieldbonus, :sizemodifier, :naturalarmor, :deflectionmodifier, :miscmodifier           
    attr_accessible :speed                  
    attr_accessible :touchac, :flatfootedac, :totalinit, :miscinit     

    
    def strength_bonus
        modifier = self.temporarystrength || self.strength
        characteristic_bonus(modifier)
    end

    def dexterity_bonus
        modifier = self.temporarydexterity || self.dexterity
        characteristic_bonus(modifier)
    end

    def constitution_bonus
        modifier = self.temporaryconstitution || self.constitution
        characteristic_bonus(modifier)
    end

    def wisdom_bonus
        modifier =  self.temporarywisdom || self.wisdom
        characteristic_bonus(modifier)
    end

    def inteligence_bonus
        modifier = self.temporaryintelligence || self.intelligence
        characteristic_bonus(modifier)
    end

    def charisma_bonus
        modifier = self.temporarycharisma || self.charisma
        characteristic_bonus(modifier)
    end
    
    def characteristic_bonus(value)
        value ? ((value.to_i - 10) / 2).floor : nil
    end
    
    def  total_armorclass
      10 + self.armorbonus.to_i + self.shieldbonus.to_i + dexterity_bonus.to_i + self.sizemodifier.to_i + self.naturalarmor.to_i + self.deflectionmodifier.to_i + self.miscmodifier.to_i
    end
    
    def skill_attributes=(attributes)
      
    end
         
end