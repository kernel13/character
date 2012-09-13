class Skill < ActiveRecord::Base
  
  #relationship
  has_many :abilities, :dependent => :destroy
  has_many :character_sheets, :through => :abilities
  has_many :children, :class_name => "Skill", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Skill"
  
  #validation
  validates :name, :presence => true
  validates :characteristic, :presence => true
  validates :characteristic, :inclusion => { :in => %w(strength dexterity constitution intelligence wisdom charisma) }
  
  #accessor
  attr_accessible :name, :characteristic, :synergy  
  
  
  def children?
      Skill.where(:parent_id => self.id).count > 0
  end
  
  def children
      Skill.where(:parent_id => self.id)
  end
end
