class Weapon < ActiveRecord::Base
  belongs_to :character_sheet
  
  attr_accessible :attack, :bonus, :critical, :dammage, :notes, :range, :weapon_type
end
