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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151015135513) do

  create_table "medecins", force: :cascade do |t|
    t.string   "nom"
    t.string   "lieu"
    t.string   "specialite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "medecin_id"
    t.integer  "patient_id"
    t.string   "texte"
    t.date     "date"
    t.integer  "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prescriptions", ["medecin_id"], name: "index_prescriptions_on_medecin_id"
  add_index "prescriptions", ["patient_id"], name: "index_prescriptions_on_patient_id"

end
