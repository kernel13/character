class CharacterSheet < ActiveRecord::Base
    
    #relationship
    has_many :abilities, :dependent => :destroy
    has_many :skills, :through => :abilities
    accepts_nested_attributes_for :abilities
    
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
    #attr_accessible :name, :race, :deity, :gender, :height, :weight, :sizeCategory, :alignment, :master, :age, :eyes, :hair, :skin
    #attr_accessible :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
    #attr_accessible :temporarystrength, :temporarydexterity, :temporaryconstitution, :temporaryintelligence, :temporarywisdom, :temporarycharisma      
    #attr_accessible :wounds, :nonelethal, :totalhp, :totalac 
    #attr_accessible :armorbonus, :shieldbonus, :sizemodifier, :naturalarmor, :deflectionmodifier, :miscmodifier           
    #attr_accessible :speed                  
    #attr_accessible :touchac, :flatfootedac, :totalinit, :miscinit     
    attr_accessor :total_armorclass, :initiative
    attr_accessor :fortitudeTotalSavingThrow, :reflexTotalSavingThrow, :willTotalSavingThrow
    attr_accessor :strength_bonus, :dexterity_bonus, :constitution_bonus, :wisdom_bonus, :intelligence_bonus, :charisma_bonus
    
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

    def intelligence_bonus
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
    
    def get_bonus(characteristic)
        characteristic_bonus(self.send(characteristic))
    end
    
    def  total_armorclass
      10 + self.armorbonus.to_i + self.shieldbonus.to_i + dexterity_bonus.to_i + self.sizemodifier.to_i + self.naturalarmor.to_i + self.deflectionmodifier.to_i + self.miscmodifier.to_i
    end
    
    def initiative
        dexterity_bonus.to_i + self.miscinit.to_i
    end
    
    def fortitudeTotalSavingThrow
        self.fortitudebasesavingthrow.to_i + constitution_bonus.to_i + 
          self.fortitudemagicsavingthrow.to_i + self.fortitudemiscsavingthrow.to_i + 
          self.fortitudetempsavingthrow.to_i
    end
    
    def reflexTotalSavingThrow
      self.reflexbasesavingthrow.to_i + constitution_bonus.to_i + 
        self.reflexmagicsavingthrow.to_i + self.reflexmiscsavingthrow.to_i + 
        self.reflextempsavingthrow.to_i
    end
    
     def willTotalSavingThrow
        self.willbasesavingthrow.to_i + constitution_bonus.to_i + 
          self.willmagicsavingthrow.to_i + self.willmiscsavingthrow.to_i + 
          self.willtempsavingthrow.to_i
     end
     
     def totalgrapple
        strength_bonus.to_i + self.base_attack.to_i + self.sizemodifier.to_i + self.grapplemisc.to_i
     end
end