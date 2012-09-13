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

ActiveRecord::Schema.define(:version => 20120910144648) do

  create_table "abilities", :force => true do |t|
    t.integer  "character_sheet_id"
    t.integer  "skill_id"
    t.integer  "ranks"
    t.integer  "misc"
    t.boolean  "skill_class"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

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
    t.integer  "base_attack"
    t.integer  "spell_resist"
    t.integer  "grapplemisc"
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

end
