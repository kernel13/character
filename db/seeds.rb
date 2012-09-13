# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
File.readlines(Rails.root.join("db", "competenceList.txt")).each do |line| 
  
    name, characteristic, native, parent = line.split("::")
  
    skill = Skill.find_by_name(parent.strip!) if parent
    
    s = Skill.find_or_create_by_name(:name => name)    
    s.characteristic = characteristic
    s.native = native
    s.parent_id = skill.id if skill
    
    s.save
end