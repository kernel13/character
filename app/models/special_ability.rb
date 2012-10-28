class SpecialAbility < ActiveRecord::Base
  belongs_to :character_sheet
  
  attr_accessible :character_sheet_id, :name
end
