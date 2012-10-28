class Spell < ActiveRecord::Base
  belongs_to :character_sheet
  
  attr_accessible :bonus_spells, :level, :spell_save, :spells_known, :spells_per_day
  
  
end
