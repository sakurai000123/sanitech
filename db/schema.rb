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

ActiveRecord::Schema.define(version: 2020_12_28_114416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "name_ruby", limit: 255
    t.string "master_key", limit: 255
    t.string "password_digest", limit: 255, null: false
    t.string "employee_no", limit: 255, null: false
    t.date "joined_company_date"
    t.string "company_phone", limit: 20
    t.string "company_car_no", limit: 255
    t.string "emergency_contact_phone", limit: 20
    t.string "emergency_contact_name", limit: 255
    t.string "email", limit: 255
    t.string "blood_type", limit: 2
    t.date "health_check_date"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_no"], name: "index_users_on_employee_no", unique: true
  end

end
