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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171123044452) do

  create_table "entries", force: :cascade do |t|
    t.string "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Name"], name: "index_entries_on_Name", unique: true
  end

  create_table "phone_contacts", force: :cascade do |t|
    t.string "Label"
    t.string "Number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entry_id"
    t.index ["Label", "Number", "entry_id"], name: "index_phone_contacts_on_Label_and_Number_and_entry_id", unique: true
    t.index ["Label", "entry_id"], name: "index_phone_contacts_on_Label_and_entry_id", unique: true
    t.index ["Number", "entry_id"], name: "index_phone_contacts_on_Number_and_entry_id", unique: true
    t.index ["entry_id"], name: "index_phone_contacts_on_entry_id"
  end

end
