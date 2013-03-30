require 'spec_helper'

describe Skill do
    
    before(:each) do
        @skill = FactoryGirl.build(:skill)
    end
  
    describe "with invalid data" do  
      it "must have a name" do
          Skill.new.should have_at_least(1).error_on(:name)
      end
    
      it "should have a valid characteristc" do
         @skill.characteristic = "dd"
         @skill.should have_at_least(1).error_on(:characteristic)
      end
    end
    
    it "should have 3 abilities" do
        @skill.attributes= @skill
        @skill.save
        (0..2).each {|i| @skill.abilities.create(:ranks => i)  }
        @skill.abilities.count.should eq(3)    
    end
    
    
    
end
