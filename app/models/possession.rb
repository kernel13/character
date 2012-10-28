class Possession < ActiveRecord::Base
  belongs_to :character_sheet
  
  attr_accessible :item, :weight
end
