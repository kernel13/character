require 'spec_helper'

describe "character_sheets/show" do
  before(:each) do
    @character_sheet = assign(:character_sheet, stub_model(CharacterSheet,
      :name => "Name",
      :race => "Race",
      :deity => "Deity",
      :gender => "Gender",
      :height => 1.5,
      :weight => "Weight",
      :integer => "Integer",
      :sizeCategory => "Size Category",
      :alignment => "Alignment",
      :master => "Master",
      :age => 1,
      :eyes => "Eyes",
      :hair => "Hair",
      :skin => "Skin",
      :strengh => 2,
      :dexterity => 3,
      :constitution => 4,
      :intelligence => 5,
      :wisdom => 6,
      :charisma => 7
    ))
  end

  it "renders attributes in <p>" do
    pending ("character show")
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
