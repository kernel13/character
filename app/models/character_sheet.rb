
# Class CharacherSheet

class CharacterSheet < ActiveRecord::Base
    acts_as_tenant (:user)
    
    #relationship
    has_many :abilities, :dependent => :destroy
    has_many :skills, :through => :abilities
    has_many :weapons, :dependent => :destroy
    has_many :gears, :dependent => :destroy
    has_many :possessions, :dependent => :destroy
    has_many :feats, :dependent => :destroy
    has_many :special_abilities, :dependent => :destroy
    has_many :languages, :dependent => :destroy
    has_many :spells, :dependent => :destroy
    belongs_to :user
    
    accepts_nested_attributes_for :abilities
    accepts_nested_attributes_for :weapons
    accepts_nested_attributes_for :gears
    accepts_nested_attributes_for :possessions
    accepts_nested_attributes_for :feats
    accepts_nested_attributes_for :special_abilities
    accepts_nested_attributes_for :languages
    accepts_nested_attributes_for :spells
    
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
    attr_accessible :name, :classes, :race, :deity, :gender, :height, :weight, :sizeCategory, :alignment, :master, :age, :eyes, :hair, :skin
    attr_accessible :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
    attr_accessible :temporarystrength, :temporarydexterity, :temporaryconstitution, :temporaryintelligence, :temporarywisdom, :temporarycharisma      
    attr_accessible :wounds, :nonelethal, :totalhp, :totalac 
    attr_accessible :armorbonus, :shieldbonus, :sizemodifier, :naturalarmor, :deflectionmodifier, :miscmodifier           
    attr_accessible :speed                  
    attr_accessible :touchac, :flatfootedac, :totalinit, :miscinit     
    attr_accessible :current_tempstrength_bonus, :current_tempdexterity_bonus, :current_tempconstitution_bonus, :current_tempintelligence_bonus, :current_tempwisdom_bonus, :current_tempcharisma_bonus
    attr_accessible :current_strength_bonus, :current_dexterity_bonus, :current_constitution_bonus, :current_intelligence_bonus, :current_wisdom_bonus, :current_charisma_bonus
    attr_accessible :total_armorclass, :dexterity_bonus, :initiative, :fortitudeTotalSavingThrow, :fortitudebasesavingthrow, :constitution_bonus
    attr_accessible :fortitudemagicsavingthrow, :fortitudemiscsavingthrow, :fortitudetempsavingthrow, :reflexTotalSavingThrow, :reflexbasesavingthrow, :reflexmagicsavingthrow
    attr_accessible :reflexmiscsavingthrow, :willTotalSavingThrow, :willbasesavingthrow, :wisdom_bonus, :willmagicsavingthrow, :willmiscsavingthrow
    attr_accessible :base_attack, :spell_resist, :totalgrapple, :strength_bonus, :grapplemisc, :weapons_attributes, :abilities_attributes, :campaign, :experience, :gears_attributes
    attr_accessible :possessions_attributes, :total_load, :light_load, :medium_load, :heavy_load, :lift_over_head, :lift_off_ground, :push_or_drag, :money, :feats_attributes
    attr_accessible :special_abilities_attributes, :languages_attributes, :turn_undead_times_per_day, :turn_undead_check, :turn_undead_damage, :psi_powers_known, :psi_max_level
    attr_accessible :psi_primary_dicipline, :psi_power_points_per_day, :divine_domain_name1, :divine_granted_power1, :divine_domain_name2, :divine_granted_power2
    attr_accessible :arcane_speciality_school, :arcane_prohibited_school1, :arcane_prohibited_school2, :arcane_spell_failure, :spells_attributes, :notes
    
    attr_accessor :total_armorclass, :initiative
    attr_accessor :fortitudeTotalSavingThrow, :reflexTotalSavingThrow, :willTotalSavingThrow
    attr_accessor :strength_bonus, :dexterity_bonus, :constitution_bonus, :wisdom_bonus, :intelligence_bonus, :charisma_bonus
    attr_accessor :totalgrapple
    attr_accessor :current_strength_bonus, :current_dexterity_bonus, :current_constitution_bonus, :current_intelligence_bonus, :current_wisdom_bonus, :current_charisma_bonus
    attr_accessor :current_tempstrength_bonus, :current_tempdexterity_bonus, :current_tempconstitution_bonus, :current_tempintelligence_bonus, :current_tempwisdom_bonus, :current_tempcharisma_bonus
    
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
    
    def current_strength_bonus
      self.characteristic_bonus(self.strength)
    end
    
    def current_dexterity_bonus
      self.characteristic_bonus(self.dexterity)
    end
    
    def current_constitution_bonus
      self.characteristic_bonus(self.constitution)
    end
    
    def current_wisdom_bonus
      self.characteristic_bonus(self.wisdom)
    end
    
    def current_intelligence_bonus
      self.characteristic_bonus(self.intelligence)
    end
    
    def current_charisma_bonus
      self.characteristic_bonus(self.charisma)
    end
    
    def current_tempstrength_bonus
      self.characteristic_bonus(self.temporarystrength)
    end

    def current_tempdexterity_bonus
      self.characteristic_bonus(self.temporarydexterity)
    end

    def current_tempconstitution_bonus
      self.characteristic_bonus(self.temporaryconstitution)
    end

    def current_tempwisdom_bonus
      self.characteristic_bonus(self.temporarywisdom)
    end

    def current_tempintelligence_bonus
      self.characteristic_bonus(self.temporaryintelligence)
    end

    def current_tempcharisma_bonus
      self.characteristic_bonus(self.temporarycharisma)
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
      self.reflexbasesavingthrow.to_i + dexterity_bonus.to_i + 
        self.reflexmagicsavingthrow.to_i + self.reflexmiscsavingthrow.to_i + 
        self.reflextempsavingthrow.to_i
    end
    
     def willTotalSavingThrow
        self.willbasesavingthrow.to_i + wisdom_bonus.to_i + 
          self.willmagicsavingthrow.to_i + self.willmiscsavingthrow.to_i + 
          self.willtempsavingthrow.to_i
     end
     
     def totalgrapple    
        baseAttack = attacks ? attacks[0].to_i : 0
        strength_bonus.to_i + baseAttack + self.sizemodifier.to_i + self.grapplemisc.to_i
     end
     
     def attacks
          self.base_attack.split('/') if self.base_attack
     end
end