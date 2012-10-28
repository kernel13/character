class Gear < ActiveRecord::Base
  belongs_to :character_sheet
  
  attr_accessible :ac_bonus, :check_penalty, :protective_item, :max_dex, :special_properties, :speed, :spell_failure, :type, :weight, :category
end
