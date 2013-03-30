require 'spec_helper'

describe "CharacterSheets" do
  include RequestMacros
  
  describe "GET /character_sheets" do        
    it "should get character1" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      FactoryGirl.create(:character_sheet)
      visit character_sheets_path      
      login_user    
      page.should have_content("character1")
    end
  end
  
  describe "GET /character_sheets/new" do
       it "should get a new chararcter sheet" do

            visit new_character_sheet_path
            login_user           
            current_path.should eq new_character_sheet_path

      end
      
      it "should create a new character sheet" do
  
            visit new_character_sheet_path
            login_user           
            
            fill_in 'txtCharacterName', with: 'character2'
            click_on 'Save'
            
            page.should have_content("character2")
                       
      end
  end
end
