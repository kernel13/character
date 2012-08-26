require 'spec_helper'

describe Skill do
  
   def valid_attributes
      {
        :name => 'competence name',
        :characteristic => 'strength'
      }
   end
    
    
    before(:each) do
        @skill = Skill.new
    end
    
    
    it "must have a name" do
        @skill.should have(1).error_on(:name)
    end
    
    it "must have a characteristic" do
        @skill.should have(2).error_on(:characteristic)
    end
    
    it "should have a valid characteristc" do
       @skill.characteristic = "dd"
       @skill.should have(1).error_on(:characteristic)
    end
    
    it "should be valid with characteristic eq strengh" do
      @skill.attributes= valid_attributes
      @skill.should have(0).error_on(:characteristic)
    end
end
