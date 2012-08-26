require 'spec_helper'

describe CharacterSheet, ".validates" do
  
  before do
      @characterSheet = CharacterSheet.new
  end
  
  # => General information
  it "should not allow empty name" do
    @characterSheet.should_not be_valid
  end
  
  it "should not validate height if not a number" do
    @characterSheet.height = "height" 
    @characterSheet.should_not be_valid
  end

  it "should not validate weight if not a number" do    
    @characterSheet.weight = "weight" 
    @characterSheet.should_not be_valid
  end
  
  it "should not validate age if not a number" do    
    @characterSheet.age = "weight" 
    @characterSheet.should_not be_valid
  end
    
  # => Characteristic
  it "should not validate strength if not a number" do    
    @characterSheet.strength = "strengh"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate dexterity if not a number" do    
    @characterSheet.dexterity = "dexterity"
    @characterSheet.should_not be_valid
  end 
      
  it "should not validate constitution if not a number" do      
    @characterSheet.constitution = "constitution"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate intelligence if not a number" do    
    @characterSheet.intelligence = "intelligence"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate wisdom if not a number" do    
    @characterSheet.wisdom = "wisdom"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate charisma if not a number" do    
    @characterSheet.charisma = "charisma"
    @characterSheet.should_not be_valid
  end

  it "should not validate temporaryStrength if not a number" do    
    @characterSheet.temporarystrength = "temporaryStrength"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate temporaryDexterity if not a number" do    
    @characterSheet.temporarydexterity = "temporaryDexterity"
    @characterSheet.should_not be_valid
  end 
      
  it "should not validate temporaryConstitution if not a number" do      
    @characterSheet.temporaryconstitution = "temporaryConstitution"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate temporaryIntelligence if not a number" do    
    @characterSheet.temporaryintelligence = "temporaryIntelligence"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate temporaryWisdom if not a number" do    
    @characterSheet.temporarywisdom = "temporaryWisdom"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate temporaryCharisma if not a number" do    
    @characterSheet.temporarycharisma = "temporaryCharisma"
    @characterSheet.should_not be_valid
  end
  
  # => Heal Points
  it "should not validate wounds if not a number" do
    @characterSheet.wounds = "wounds"
    @characterSheet.should_not be_valid
  end
  
  
  it "should not validate nonelethal if not a number" do
    @characterSheet.nonelethal = "nonelethal"
    @characterSheet.should_not be_valid
  end
  
  
  it "should not validate totalhp if not a number" do
    @characterSheet.totalhp = "totalhp"
    @characterSheet.should_not be_valid
  end
  
  
  it "should not validate totalac if not a number" do
    @characterSheet.totalac = "totalac"
    @characterSheet.should_not be_valid
  end
  
  # => Armor
  it "should not validate armorbonus if not a number" do
    @characterSheet.armorbonus = "armorbonus"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate shieldbonus if not a number" do
    @characterSheet.shieldbonus = "shieldbonus"
    @characterSheet.should_not be_valid
  end

  it "should not validate sizemodifier if not a number" do
    @characterSheet.sizemodifier = "sizemodifier"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate naturalarmor if not a number" do
    @characterSheet.naturalarmor = "naturalarmor"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate deflectionmodifier if not a number" do
    @characterSheet.deflectionmodifier = "deflectionmodifier"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate miscmodifier if not a number" do
    @characterSheet.miscmodifier = "miscmodifier"
    @characterSheet.should_not be_valid
  end
  
  # => Armor class
  it "should not validate touchac if not a number" do
    @characterSheet.touchac = "touchac"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate flatfootedac if not a number" do
    @characterSheet.flatfootedac = "flatfootedac"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate totalinit if not a number" do
    @characterSheet.totalinit = "totalinit"
    @characterSheet.should_not be_valid
  end
  
  it "should not validate miscinit if not a number" do
    @characterSheet.miscinit = "miscinit"
    @characterSheet.should_not be_valid
  end

  # => Speed
  it "should not validate speed if not a number" do
    @characterSheet.speed = "speed"
    @characterSheet.should_not be_valid
  end
  
  
end

describe CharacterSheet, ".methods" do

  before do
      @characterSheet = CharacterSheet.new 
  end

  it "characteristic bonus strength with a value of 18 should equal 4" do
      @characterSheet.strength = 18
      @characterSheet.strength_bonus.should eq(4)
  end
  
  it "characteristic bonus strength with a value of 18 and temporary value of 16 should equal 3" do
      @characterSheet.strength = 18
      @characterSheet.temporarystrength = 16      
      @characterSheet.strength_bonus.should eq(3)
  end
  
  it "characteristic bonus should be nill if characteristic not defined" do
      @characterSheet.strength_bonus.should be_nil
  end
  
  it "armor class should be equal to 20" do
    @characterSheet.dexterity = 18
    @characterSheet.armorbonus = 4
    @characterSheet.naturalarmor = 10
    @characterSheet.miscmodifier = 2
    
    @characterSheet.total_armorclass.should eq(30)
  end
  
  it "armor class should equal to 0" do
    @characterSheet.dexterity = 10
    @characterSheet.total_armorclass.should eq(10)
  end
  
  it "armor class should be equal to 18 with size category malus of 2" do
      @characterSheet.dexterity = 18
      @characterSheet.armorbonus = 4
      @characterSheet.naturalarmor = 10
      @characterSheet.miscmodifier = 2
      @characterSheet.sizemodifier = -2

      @characterSheet.total_armorclass.should eq(28)
  end
  
end
