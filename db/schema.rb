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

ActiveRecord::Schema.define(version: 2021_01_15_045750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "m_customers", id: false, force: :cascade do |t|
    t.string "customer_code"
    t.text "create_user_name"
    t.text "update_user_name"
    t.text "customer_number"
    t.text "customer_name"
    t.text "customer_name_kana"
    t.string "department_code"
    t.string "user_code"
    t.text "charge_name"
    t.text "charge_name_kana"
    t.text "charge_position"
    t.string "cus_post_code"
    t.text "cus_prefecture"
    t.text "cus_address1"
    t.text "cus_address2"
    t.string "phone_number"
    t.string "fax_number"
    t.text "mail_address"
    t.string "payment_category"
    t.string "close_date"
    t.string "payment_date"
    t.string "deposit_account_code"
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "m_suppliers", primary_key: "supplier_code", id: :string, limit: 5, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "supplier_number", null: false
    t.date "start_date", null: false
    t.string "department_code", null: false
    t.string "user_code", null: false
    t.text "supplier_name", null: false
    t.text "charge_name", null: false
    t.text "charge_position", null: false
    t.string "post_code", null: false
    t.text "prefecture", null: false
    t.text "address1", null: false
    t.text "address2", null: false
    t.string "phone_number", null: false
    t.string "fax_number", null: false
    t.string "payment_category", null: false
    t.string "close_date", null: false
    t.string "payment_day", null: false
    t.string "payment_account_code", null: false
    t.text "note"
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

  create_table "t_estimate_details", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "t_estimate_id", null: false
    t.integer "line_number", limit: 2, null: false
    t.integer "sort_number", limit: 2, null: false
    t.string "maker_code", limit: 4, null: false
    t.text "maker_name", null: false
    t.string "supplier_code", limit: 5, null: false
    t.string "product_code", limit: 8, null: false
    t.text "product_name", null: false
    t.text "product_model_number", null: false
    t.integer "estimate_quantity", limit: 2, null: false
    t.text "product_unit", null: false
    t.bigint "sale_unit_price", null: false
    t.integer "multiplication_rate", limit: 2, null: false
    t.bigint "detail_estimate_amount", null: false
    t.bigint "list_price", null: false
    t.bigint "original_unit_price", null: false
    t.bigint "cost_price", null: false
    t.integer "gross_profit_margin", limit: 2, null: false
    t.bigint "detail_tax_amount", null: false
    t.text "detail_note"
    t.text "details_memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["t_estimate_id"], name: "index_t_estimate_details_on_t_estimate_id"
  end

  create_table "t_estimates", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "estimate_number", null: false
    t.integer "estimate_branch_number", limit: 2, null: false
    t.date "estimate_date", null: false
    t.string "department_code", limit: 3, null: false
    t.string "charge_code", limit: 4, null: false
    t.string "issuer_code", limit: 4, null: false
    t.string "authorizer_code", limit: 4, null: false
    t.string "customer_code", limit: 6, null: false
    t.text "cus_department_name", null: false
    t.text "cus_charge_name", null: false
    t.string "delivery_date_category", null: false
    t.string "payment_category", null: false
    t.string "delivery_place", null: false
    t.string "estimate_expiration_date", null: false
    t.text "estimate_name", null: false
    t.text "note"
    t.bigint "estimate_amount", null: false
    t.bigint "tax_amount", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "t_estimate_details", "t_estimates"
end
