require "spec_helper"

describe CharacterSheetsController do
  describe "routing" do

    it "routes to #index" do
      get("/character_sheets").should route_to("character_sheets#index")
    end

    it "routes to #new" do
      get("/character_sheets/new").should route_to("character_sheets#new")
    end

    it "routes to #show" do
      get("/character_sheets/1").should route_to("character_sheets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/character_sheets/1/edit").should route_to("character_sheets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/character_sheets").should route_to("character_sheets#create")
    end

    it "routes to #update" do
      put("/character_sheets/1").should route_to("character_sheets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/character_sheets/1").should route_to("character_sheets#destroy", :id => "1")
    end

  end
end
