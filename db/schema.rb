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

ActiveRecord::Schema.define(version: 20170612095104) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "address"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "PoC"
    t.text "address"
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "owner_name"
    t.string "org_type"
    t.string "PAN"
    t.string "ST_num"
    t.date "reg_date"
    t.string "CIN"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_carriers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_carriers_on_reset_password_token", unique: true
  end

  create_table "drivers", force: :cascade do |t|
    t.string "DL"
    t.date "DL_issue_date"
    t.string "name"
    t.string "phone"
    t.text "address"
    t.date "DOB"
    t.string "blood_group"
    t.date "DL_expiry"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_drivers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true
    t.index ["truck_id"], name: "index_drivers_on_truck_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "num_trucks"
    t.string "source"
    t.string "destination"
    t.string "poc_src"
    t.string "poc_dest"
    t.string "phone_src"
    t.string "phone_dest"
    t.string "email_src"
    t.string "email_dest"
    t.date "reqd_date"
    t.string "service_lvl"
    t.integer "load_weight"
    t.integer "load_height"
    t.integer "load_length"
    t.integer "load_width"
    t.integer "shipper_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipper_id"], name: "index_requests_on_shipper_id"
    t.index ["truck_id"], name: "index_requests_on_truck_id"
  end

  create_table "shippers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "poc"
    t.string "email", default: "", null: false
    t.string "phone"
    t.string "org_type"
    t.string "PAN"
    t.string "ST_num"
    t.string "CIN"
    t.date "reg_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_shippers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shippers_on_reset_password_token", unique: true
  end

  create_table "trucks", force: :cascade do |t|
    t.string "registration_num"
    t.string "engine_num"
    t.string "chasis_num"
    t.string "manufacturer"
    t.string "model"
    t.integer "load_capacity"
    t.integer "load_height"
    t.integer "load_width"
    t.integer "load_base_length"
    t.string "registration_auth"
    t.string "fitness"
    t.date "purchase_date"
    t.string "insurer"
    t.string "policy_num"
    t.date "insurance_expiry"
    t.date "permit_expiry"
    t.integer "gross_vehicle_weight"
    t.integer "unloaded_weight"
    t.string "body_type"
    t.string "current_location"
    t.string "current_status"
    t.integer "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_trucks_on_carrier_id"
  end

end
