FactoryGirl.define do
  factory :user do |f|
    f.email "user1@user.com" 
    f.password "secret"
    f.password_confirmation {|u| u.password }
  end
  
  factory :skill do |f|
      f.name "nage"
      f.characteristic "strength"
  end
  

  factory :character_sheet do |c|
    c.name "character1"

    factory :full_sheet do |f|
      f.race "race"
      f.deity "deity"
      f.gender "gender"
      f.height 1
      f.weight 1
      f.alignment "LB"
      f.master "master"
      f.age 1
      f.eyes "eyes"
      f.hair "hair"
      f.skin "skin"
      f.strength 10
      f.dexterity 10
      f.constitution 10
      f.intelligence 10
      f.wisdom 10
      f.charisma 10
      f.temporarystrength 0
      f.temporarydexterity 0
      f.temporaryconstitution 0
      f.temporaryintelligence 0
      f.temporarywisdom 0
      f.temporarycharisma 0
      f.wounds 1
      f.nonelethal 1
      f.totalhp 1
      f.totalac 1
      f.armorbonus 1
      f.shieldbonus 1
      f.sizemodifier 1
      f.naturalarmor 1
      f.deflectionmodifier 1
      f.miscmodifier 1
      f.speed 9
      f.touchac 10
      f.flatfootedac 10
      f.totalinit 5
      f.miscinit 1
      f.fortitudebasesavingthrow 1
      f.fortitudemagicsavingthrow 1
      f.fortitudemiscsavingthrow 1
      f.fortitudetempsavingthrow 1
      f.reflexbasesavingthrow 1
      f.reflexmagicsavingthrow 1
      f.reflexmiscsavingthrow 1
      f.reflextempsavingthrow 1
      f.willbasesavingthrow 1
      f.willmagicsavingthrow 1
      f.willmiscsavingthrow 1
      f.willtempsavingthrow 1
      f.spell_resist 1
      f.grapplemisc 1
      f.campaign "campaign"
      f.experience 1
      f.light_load 1
      f.medium_load 1
      f.heavy_load 1
      f.lift_over_head 1
      f.lift_off_ground 1
      f.push_or_drag 1
      f.total_load 1
      f.money 1
      f.classes "classes"
      f.base_attack 1
      f.divine_domain_name1 "domain"
      f.divine_granted_power1 "domain"
      f.divine_domain_name2 "domain"
      f.divine_granted_power2 "domain"
      f.arcane_speciality_school "arcane"
      f.arcane_prohibited_school1 "arcane"
      f.arcane_prohibited_school2 "arcane"
      f.arcane_spell_failure "arcane"
      f.psi_powers_known 1
      f.psi_max_level 1
      f.psi_primary_dicipline "dicipline"
      f.psi_power_points_per_day 1
      f.turn_undead_times_per_day 1
      f.turn_undead_check 1
      f.turn_undead_damage 1  
      f.notes "notes"  
    end 

    user        
  end
end