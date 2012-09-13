require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CharacterSheetsController do

  # This should return the minimal set of attributes required to create a valid
  # CharacterSheet. As you add validations to CharacterSheet, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => 'character_name'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CharacterSheetsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all character_sheets as @character_sheets" do
      character_sheet = CharacterSheet.create! valid_attributes
      get :index, {}, valid_session
      assigns(:character_sheets).should eq([character_sheet])
    end
  end

  describe "GET show" do
    it "assigns the requested character_sheet as @character_sheet" do
      character_sheet = CharacterSheet.create! valid_attributes
      get :show, {:id => character_sheet.to_param}, valid_session
      assigns(:character_sheet).should eq(character_sheet)
    end
  end

  describe "GET new" do
    it "assigns a new character_sheet as @character_sheet" do
      get :new, {}, valid_session
      assigns(:character_sheet).should be_a_new(CharacterSheet)
    end
  end

  describe "GET edit" do
    it "assigns the requested character_sheet as @character_sheet" do
      character_sheet = CharacterSheet.create! valid_attributes
      get :edit, {:id => character_sheet.to_param}, valid_session
      assigns(:character_sheet).should eq(character_sheet)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CharacterSheet" do
        expect {
          post :create, {:character_sheet => valid_attributes}, valid_session
        }.to change(CharacterSheet, :count).by(1)
      end

      it "assigns a newly created character_sheet as @character_sheet" do
        post :create, {:character_sheet => valid_attributes}, valid_session
        assigns(:character_sheet).should be_a(CharacterSheet)
        assigns(:character_sheet).should be_persisted
      end

      it "redirects to the created character_sheet" do
        post :create, {:character_sheet => valid_attributes}, valid_session
        response.should redirect_to(CharacterSheet.last)
      end      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved character_sheet as @character_sheet" do
        # Trigger the behavior that occurs when invalid params are submitted
        CharacterSheet.any_instance.stub(:save).and_return(false)
        post :create, {:character_sheet => {}}, valid_session
        assigns(:character_sheet).should be_a_new(CharacterSheet)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CharacterSheet.any_instance.stub(:save).and_return(false)
        post :create, {:character_sheet => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested character_sheet" do
        character_sheet = CharacterSheet.create! valid_attributes
        # Assuming there are no other character_sheets in the database, this
        # specifies that the CharacterSheet created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CharacterSheet.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => character_sheet.to_param, :character_sheet => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested character_sheet as @character_sheet" do
        character_sheet = CharacterSheet.create! valid_attributes
        put :update, {:id => character_sheet.to_param, :character_sheet => valid_attributes}, valid_session
        assigns(:character_sheet).should eq(character_sheet)
      end

      it "redirects to the character_sheet" do
        character_sheet = CharacterSheet.create! valid_attributes
        put :update, {:id => character_sheet.to_param, :character_sheet => valid_attributes}, valid_session
        response.should redirect_to(character_sheet)
      end
    end

    describe "with invalid params" do
      it "assigns the character_sheet as @character_sheet" do
        character_sheet = CharacterSheet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CharacterSheet.any_instance.stub(:save).and_return(false)
        put :update, {:id => character_sheet.to_param, :character_sheet => {}}, valid_session
        assigns(:character_sheet).should eq(character_sheet)
      end

      it "re-renders the 'edit' template" do
        character_sheet = CharacterSheet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CharacterSheet.any_instance.stub(:save).and_return(false)
        put :update, {:id => character_sheet.to_param, :character_sheet => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested character_sheet" do
      character_sheet = CharacterSheet.create! valid_attributes
      expect {
        delete :destroy, {:id => character_sheet.to_param}, valid_session
      }.to change(CharacterSheet, :count).by(-1)
    end

    it "redirects to the character_sheets list" do
      character_sheet = CharacterSheet.create! valid_attributes
      delete :destroy, {:id => character_sheet.to_param}, valid_session
      response.should redirect_to(character_sheets_url)
    end
  end

  describe "With Skills" do
      it "should have skills" do
          @count = Skill.where(:parent_id => nil).count + 3
          get :new, {}, valid_session
          assigns(:character_sheet).abilities.should have(@count).abilities
      end
      
      
  end
end
