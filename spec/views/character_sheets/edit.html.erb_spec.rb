require 'spec_helper'

describe "character_sheets/edit" do
  before(:each) do
    @character_sheet = assign(:character_sheet, stub_model(CharacterSheet,
      :name => "Name",
      :race => "Race",
      :deity => "Deity",
      :gender => "Gender",
      :height => 1.5,
      :weight => "MyString",
      :integer => "MyString",
      :sizeCategory => "MyString",
      :alignment => "MyString",
      :master => "MyString",
      :age => 1,
      :eyes => "MyString",
      :hair => "MyString",
      :skin => "MyString",
      :strengh => 1,
      :dexterity => 1,
      :constitution => 1,
      :intelligence => 1,
      :wisdom => 1,
      :charisma => 1
    ))
  end

  it "renders the edit character_sheet form" do
    pending("view character")
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
