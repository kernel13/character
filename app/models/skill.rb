class Skill < ActiveRecord::Base
  
  #relationship
  has_many :abilities
  has_many :character_sheets, :through => :abilities
  
  #validation
  validates :name, :presence => true
  validates :characteristic, :presence => true
  validates :characteristic, :inclusion => { :in => %w(strength dexterity constitution intelligence wisdom charisma) }
  
  #accessor
  attr_accessible :name, :characteristic, :synergy
  
end
