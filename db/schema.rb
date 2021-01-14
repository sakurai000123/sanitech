# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_14_143153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "m_departments", primary_key: "department_code", id: :string, limit: 3, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "department_name", null: false
    t.text "department_name_kana", null: false
    t.integer "depth", limit: 2, null: false
    t.string "parent_department_code", limit: 3, null: false
    t.string "post_code", limit: 7, null: false
    t.text "prefecture", null: false
    t.text "address1", null: false
    t.text "address2", null: false
    t.string "phone_number", limit: 11, null: false
    t.string "fax_number", limit: 10
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_users", primary_key: "user_code", id: :string, limit: 4, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.string "authority_code", limit: 3, null: false
    t.string "department_code", limit: 3, null: false
    t.integer "company_car_No", limit: 2
    t.text "family_name", null: false
    t.text "family_name_kana", null: false
    t.text "given_name", null: false
    t.text "given_name_kana", null: false
    t.string "mobile_phone_number", limit: 11
    t.text "mail_address", null: false
    t.string "login_id", limit: 20, null: false
    t.string "password_digest", limit: 255, null: false
    t.date "hire_date", null: false
    t.text "master_key", null: false
    t.text "position", null: false
    t.string "emergency_phone_number", limit: 11, null: false
    t.string "blood_type", null: false
    t.date "medical_examination_date"
    t.text "note"
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
