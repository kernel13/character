# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121030194941) do

  create_table "abilities", :force => true do |t|
    t.integer  "character_sheet_id"
    t.integer  "skill_id"
    t.integer  "ranks"
    t.integer  "misc"
    t.boolean  "skill_class"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "character_sheets", :force => true do |t|
    t.string   "name"
    t.string   "race"
    t.string   "deity"
    t.string   "gender"
    t.float    "height"
    t.string   "weight"
    t.string   "integer"
    t.string   "sizeCategory"
    t.string   "alignment"
    t.string   "master"
    t.integer  "age"
    t.string   "eyes"
    t.string   "hair"
    t.string   "skin"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.integer  "temporarystrength"
    t.integer  "temporarydexterity"
    t.integer  "temporaryconstitution"
    t.integer  "temporaryintelligence"
    t.integer  "temporarywisdom"
    t.integer  "temporarycharisma"
    t.integer  "wounds"
    t.integer  "nonelethal"
    t.integer  "totalhp"
    t.integer  "totalac"
    t.integer  "armorbonus"
    t.integer  "shieldbonus"
    t.integer  "sizemodifier"
    t.integer  "naturalarmor"
    t.integer  "deflectionmodifier"
    t.integer  "miscmodifier"
    t.integer  "speed"
    t.integer  "touchac"
    t.integer  "flatfootedac"
    t.integer  "totalinit"
    t.integer  "miscinit"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "fortitudebasesavingthrow"
    t.integer  "fortitudemagicsavingthrow"
    t.integer  "fortitudemiscsavingthrow"
    t.integer  "fortitudetempsavingthrow"
    t.integer  "reflexbasesavingthrow"
    t.integer  "reflexmagicsavingthrow"
    t.integer  "reflexmiscsavingthrow"
    t.integer  "reflextempsavingthrow"
    t.integer  "willbasesavingthrow"
    t.integer  "willmagicsavingthrow"
    t.integer  "willmiscsavingthrow"
    t.integer  "willtempsavingthrow"
    t.integer  "spell_resist"
    t.integer  "grapplemisc"
    t.string   "campaign"
    t.integer  "experience"
    t.integer  "light_load"
    t.integer  "medium_load"
    t.integer  "heavy_load"
    t.integer  "lift_over_head"
    t.integer  "lift_off_ground"
    t.integer  "push_or_drag"
    t.integer  "total_load"
    t.text     "money"
    t.string   "classes"
    t.string   "base_attack"
    t.string   "divine_domain_name1"
    t.string   "divine_granted_power1"
    t.string   "divine_domain_name2"
    t.string   "divine_granted_power2"
    t.string   "arcane_speciality_school"
    t.string   "arcane_prohibited_school1"
    t.string   "arcane_prohibited_school2"
    t.string   "arcane_spell_failure"
    t.integer  "psi_powers_known"
    t.integer  "psi_max_level"
    t.string   "psi_primary_dicipline"
    t.integer  "psi_power_points_per_day"
    t.integer  "turn_undead_times_per_day"
    t.integer  "turn_undead_check"
    t.integer  "turn_undead_damage"
    t.text     "notes"
    t.integer  "user_id"
  end

  create_table "feats", :force => true do |t|
    t.string   "name"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "gears", :force => true do |t|
    t.string   "protective_item"
    t.string   "type"
    t.integer  "ac_bonus"
    t.integer  "max_dex"
    t.integer  "check_penalty"
    t.integer  "spell_failure"
    t.integer  "speed"
    t.integer  "weight"
    t.string   "special_properties"
    t.string   "category"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "possessions", :force => true do |t|
    t.string   "item"
    t.integer  "weight"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "characteristic"
    t.boolean  "native"
    t.integer  "synergy"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "parent_id"
  end

  add_index "skills", ["parent_id"], :name => "index_skills_on_parent_id"

  create_table "special_abilities", :force => true do |t|
    t.string   "name"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "spells", :force => true do |t|
    t.integer  "spells_known"
    t.integer  "spell_save"
    t.integer  "level"
    t.integer  "spells_per_day"
    t.integer  "bonus_spells"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weapons", :force => true do |t|
    t.string   "attack"
    t.integer  "bonus"
    t.string   "dammage"
    t.string   "critical"
    t.string   "range"
    t.string   "weapon_type"
    t.string   "notes"
    t.integer  "character_sheet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
