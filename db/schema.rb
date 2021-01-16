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

ActiveRecord::Schema.define(version: 2021_01_16_043141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "m_customers", primary_key: "customer_code", id: :string, limit: 6, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "customer_number", null: false
    t.text "customer_name", null: false
    t.text "customer_name_kana", null: false
    t.string "department_code_id", limit: 3, null: false
    t.string "user_code_id", limit: 4, null: false
    t.text "charge_name", null: false
    t.text "charge_name_kana", null: false
    t.text "charge_position", null: false
    t.string "cus_post_code", limit: 7, null: false
    t.text "cus_prefecture", null: false
    t.text "cus_address1", null: false
    t.text "cus_address2", null: false
    t.string "phone_number", limit: 11, null: false
    t.string "fax_number", limit: 10
    t.text "mail_address"
    t.string "payment_category", null: false
    t.string "close_date", null: false
    t.string "payment_date", null: false
    t.string "deposit_account_code", limit: 3, null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_code_id"], name: "index_m_customers_on_department_code_id"
    t.index ["user_code_id"], name: "index_m_customers_on_user_code_id"
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

  create_table "m_makers", primary_key: "maker_code", id: :string, limit: 4, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "maker_name", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_order_categories", primary_key: "order_category_code", id: :string, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "order_category_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_products", primary_key: "product_code", id: :string, limit: 8, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "product_name", null: false
    t.text "product_name_kana", null: false
    t.string "product_category", null: false
    t.text "model_number", null: false
    t.text "unit", null: false
    t.bigint "unit_price", null: false
    t.bigint "original_unit_price", null: false
    t.bigint "cost", null: false
    t.bigint "sale_unit_price", null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.string "maker_code_id", limit: 4, null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_code_id"], name: "index_m_products_on_maker_code_id"
    t.index ["supplier_code_id"], name: "index_m_products_on_supplier_code_id"
  end

  create_table "m_suppliers", primary_key: "supplier_code", id: :string, limit: 5, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "supplier_number", null: false
    t.date "start_date", null: false
    t.string "department_code_id", limit: 3, null: false
    t.string "user_code_id", limit: 4, null: false
    t.string "user_code2_id", limit: 4, null: false
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
    t.index ["department_code_id"], name: "index_m_suppliers_on_department_code_id"
    t.index ["user_code2_id"], name: "index_m_suppliers_on_user_code2_id"
    t.index ["user_code_id"], name: "index_m_suppliers_on_user_code_id"
  end

  create_table "m_users", primary_key: "user_code", id: :string, limit: 4, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.string "authority_code", limit: 3, null: false
    t.string "department_code_id", limit: 3, null: false
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
    t.index ["department_code_id"], name: "index_m_users_on_department_code_id"
  end

  create_table "m_warehouses", primary_key: "warehouse_code", id: :string, limit: 4, force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "warehouse_name", null: false
    t.string "warehouse_category", null: false
    t.string "post_code", limit: 7, null: false
    t.text "prefecture", null: false
    t.text "address1", null: false
    t.text "address2", null: false
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

  create_table "t_purchase_details", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "purchase_id", null: false
    t.integer "line_number", limit: 2, null: false
    t.integer "sort_number", limit: 2, null: false
    t.bigint "send_order_detail_id", null: false
    t.string "product_code_id", limit: 8, null: false
    t.text "product_name", null: false
    t.text "product_model_number", null: false
    t.bigint "purchase_unit_price", null: false
    t.integer "purchase_quantity", limit: 2, null: false
    t.bigint "purchase_amount", null: false
    t.date "receive_order_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_code_id"], name: "index_t_purchase_details_on_product_code_id"
    t.index ["purchase_id"], name: "index_t_purchase_details_on_purchase_id"
    t.index ["send_order_detail_id"], name: "index_t_purchase_details_on_send_order_detail_id"
  end

  create_table "t_purchases", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.date "purchase_date", null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.text "supplier_name", null: false
    t.string "user_code_id", limit: 4, null: false
    t.bigint "send_order_id", null: false
    t.bigint "receive_order_id", null: false
    t.bigint "purchase_amount", null: false
    t.bigint "tax_amount", null: false
    t.date "purchase_slip_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receive_order_id"], name: "index_t_purchases_on_receive_order_id"
    t.index ["send_order_id"], name: "index_t_purchases_on_send_order_id"
    t.index ["supplier_code_id"], name: "index_t_purchases_on_supplier_code_id"
    t.index ["user_code_id"], name: "index_t_purchases_on_user_code_id"
  end

  create_table "t_receive_order_details", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "receive_order_id", null: false
    t.integer "line_number", limit: 2, null: false
    t.integer "sort_number", limit: 2, null: false
    t.string "order_category_code_id", null: false
    t.text "order_category_name", null: false
    t.boolean "invalid_flag"
    t.string "maker_code_id", limit: 4, null: false
    t.text "maker_name", null: false
    t.string "product_code_id", limit: 8, null: false
    t.text "product_name", null: false
    t.text "product_model_number", null: false
    t.string "warehouse_code_id", limit: 4, null: false
    t.text "warehouse_name", null: false
    t.integer "receive_order_quantity", limit: 2, null: false
    t.text "product_unit", null: false
    t.boolean "unit_price_pending_flag"
    t.boolean "cost_pending_flag"
    t.bigint "sale_unit_price", null: false
    t.integer "multiplication_rate", limit: 2, null: false
    t.bigint "receive_order_detail_amount", null: false
    t.integer "profit_rate", limit: 2, null: false
    t.bigint "list_price", null: false
    t.date "stock_date", null: false
    t.bigint "original_unit_price", null: false
    t.bigint "cost_price", null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.text "supplier_name", null: false
    t.date "delivery_date", null: false
    t.text "note"
    t.boolean "spec_detail_flag"
    t.text "detail_note"
    t.text "detail_memo"
    t.bigint "pre_recorded"
    t.integer "list_price_rate", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_code_id"], name: "index_t_receive_order_details_on_maker_code_id"
    t.index ["order_category_code_id"], name: "index_t_receive_order_details_on_order_category_code_id"
    t.index ["product_code_id"], name: "index_t_receive_order_details_on_product_code_id"
    t.index ["receive_order_id"], name: "index_t_receive_order_details_on_receive_order_id"
    t.index ["supplier_code_id"], name: "index_t_receive_order_details_on_supplier_code_id"
    t.index ["warehouse_code_id"], name: "index_t_receive_order_details_on_warehouse_code_id"
  end

  create_table "t_receive_orders", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.text "receive_order_number", null: false
    t.date "receive_order_date", null: false
    t.text "estimate_number", null: false
    t.bigint "estimate_id", null: false
    t.string "department_code_id", limit: 3, null: false
    t.string "charge_code_id", limit: 4, null: false
    t.string "assistant_code_id", limit: 4, null: false
    t.string "customer_code_id", limit: 6, null: false
    t.text "cus_department_name", null: false
    t.text "cus_charge_name", null: false
    t.string "bill_code", null: false
    t.text "bill_name", null: false
    t.string "ship_code", limit: 6, null: false
    t.text "ship_charge_name", null: false
    t.string "ship_post_code", limit: 7, null: false
    t.text "ship_prefecture", null: false
    t.text "ship_address1", null: false
    t.text "ship_address2", null: false
    t.string "ship_phone_number", limit: 11, null: false
    t.string "ship_fax_number", limit: 10, null: false
    t.text "cus_order_number", null: false
    t.boolean "bulk_delivery_flag"
    t.text "receive_order_name", null: false
    t.string "aggregate_category"
    t.bigint "receive_order_amount", null: false
    t.bigint "tax_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assistant_code_id"], name: "index_t_receive_orders_on_assistant_code_id"
    t.index ["charge_code_id"], name: "index_t_receive_orders_on_charge_code_id"
    t.index ["customer_code_id"], name: "index_t_receive_orders_on_customer_code_id"
    t.index ["department_code_id"], name: "index_t_receive_orders_on_department_code_id"
    t.index ["estimate_id"], name: "index_t_receive_orders_on_estimate_id"
  end

  create_table "t_sales", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "receive_order_id", null: false
    t.date "sales_date", null: false
    t.date "close_date", null: false
    t.string "department_code_id", limit: 3, null: false
    t.string "charge_code_id", limit: 4, null: false
    t.string "assistant_code_id", limit: 4, null: false
    t.string "customer_code_id", limit: 6, null: false
    t.bigint "sales_amount", null: false
    t.integer "tax_amount", limit: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assistant_code_id"], name: "index_t_sales_on_assistant_code_id"
    t.index ["charge_code_id"], name: "index_t_sales_on_charge_code_id"
    t.index ["customer_code_id"], name: "index_t_sales_on_customer_code_id"
    t.index ["department_code_id"], name: "index_t_sales_on_department_code_id"
    t.index ["receive_order_id"], name: "index_t_sales_on_receive_order_id"
  end

  create_table "t_sales_details", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "sale_id", null: false
    t.integer "line_number", limit: 2, null: false
    t.integer "sort_number", limit: 2, null: false
    t.string "product_code_id", limit: 8, null: false
    t.text "product_name", null: false
    t.text "product_model_number", null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.text "supplier_name", null: false
    t.bigint "sale_unit_price", null: false
    t.integer "ship_quantity", limit: 2, null: false
    t.text "product_unit", null: false
    t.bigint "sales_detail_amount", null: false
    t.string "sales_category"
    t.boolean "visible_maker_flag"
    t.boolean "shipped_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_code_id"], name: "index_t_sales_details_on_product_code_id"
    t.index ["sale_id"], name: "index_t_sales_details_on_sale_id"
    t.index ["supplier_code_id"], name: "index_t_sales_details_on_supplier_code_id"
  end

  create_table "t_send_order_details", force: :cascade do |t|
    t.text "create_user_name", null: false
    t.text "update_user_name", null: false
    t.bigint "send_order_id", null: false
    t.integer "line_number", limit: 2, null: false
    t.integer "sort_number", limit: 2, null: false
    t.bigint "receive_order_detail_id", null: false
    t.string "maker_code_id", limit: 4, null: false
    t.text "maker_name", null: false
    t.string "product_code_id", limit: 8, null: false
    t.text "product_name", null: false
    t.text "product_model_number", null: false
    t.integer "send_order_quantity", limit: 2, null: false
    t.text "product_unit", null: false
    t.bigint "purchase_unit_price", null: false
    t.bigint "receive_order_detail_amount", null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.text "supplier_name", null: false
    t.text "supplier_charge_name", null: false
    t.bigint "unit_price", null: false
    t.date "delivery_deadline", null: false
    t.boolean "send_direct_flag"
    t.string "customer_code", limit: 6
    t.text "cus_charge_name"
    t.string "cus_post_code", limit: 7
    t.text "cus_prefecture"
    t.text "cus_address1"
    t.text "cus_address2"
    t.string "cus_phone_number", limit: 11
    t.string "cus_fax_number", limit: 10
    t.text "note"
    t.boolean "bill_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_code_id"], name: "index_t_send_order_details_on_maker_code_id"
    t.index ["product_code_id"], name: "index_t_send_order_details_on_product_code_id"
    t.index ["receive_order_detail_id"], name: "index_t_send_order_details_on_receive_order_detail_id"
    t.index ["send_order_id"], name: "index_t_send_order_details_on_send_order_id"
    t.index ["supplier_code_id"], name: "index_t_send_order_details_on_supplier_code_id"
  end

  create_table "t_send_orders", force: :cascade do |t|
    t.text "create_user_name"
    t.text "update_user_name"
    t.text "send_order_number"
    t.text "send_order_branch_number"
    t.date "send_order_date"
    t.bigint "receive_order_id", null: false
    t.string "department_code_id", limit: 3, null: false
    t.string "user_code_id", limit: 4, null: false
    t.string "supplier_code_id", limit: 5, null: false
    t.bigint "send_order_amount"
    t.integer "tax_amount", limit: 2
    t.boolean "completion_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_code_id"], name: "index_t_send_orders_on_department_code_id"
    t.index ["receive_order_id"], name: "index_t_send_orders_on_receive_order_id"
    t.index ["supplier_code_id"], name: "index_t_send_orders_on_supplier_code_id"
    t.index ["user_code_id"], name: "index_t_send_orders_on_user_code_id"
  end

  add_foreign_key "m_customers", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "m_customers", "m_users", column: "user_code_id", primary_key: "user_code"
  add_foreign_key "m_products", "m_makers", column: "maker_code_id", primary_key: "maker_code"
  add_foreign_key "m_products", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "m_suppliers", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "m_suppliers", "m_users", column: "user_code2_id", primary_key: "user_code"
  add_foreign_key "m_suppliers", "m_users", column: "user_code_id", primary_key: "user_code"
  add_foreign_key "m_users", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "t_estimate_details", "t_estimates"
  add_foreign_key "t_purchase_details", "m_products", column: "product_code_id", primary_key: "product_code"
  add_foreign_key "t_purchase_details", "t_purchases", column: "purchase_id"
  add_foreign_key "t_purchase_details", "t_send_order_details", column: "send_order_detail_id"
  add_foreign_key "t_purchases", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "t_purchases", "m_users", column: "user_code_id", primary_key: "user_code"
  add_foreign_key "t_purchases", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_purchases", "t_send_orders", column: "send_order_id"
  add_foreign_key "t_receive_order_details", "m_makers", column: "maker_code_id", primary_key: "maker_code"
  add_foreign_key "t_receive_order_details", "m_order_categories", column: "order_category_code_id", primary_key: "order_category_code"
  add_foreign_key "t_receive_order_details", "m_products", column: "product_code_id", primary_key: "product_code"
  add_foreign_key "t_receive_order_details", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "t_receive_order_details", "m_warehouses", column: "warehouse_code_id", primary_key: "warehouse_code"
  add_foreign_key "t_receive_order_details", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_receive_orders", "m_customers", column: "customer_code_id", primary_key: "customer_code"
  add_foreign_key "t_receive_orders", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "t_receive_orders", "m_users", column: "assistant_code_id", primary_key: "user_code"
  add_foreign_key "t_receive_orders", "m_users", column: "charge_code_id", primary_key: "user_code"
  add_foreign_key "t_receive_orders", "t_estimates", column: "estimate_id"
  add_foreign_key "t_sales", "m_customers", column: "customer_code_id", primary_key: "customer_code"
  add_foreign_key "t_sales", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "t_sales", "m_users", column: "assistant_code_id", primary_key: "user_code"
  add_foreign_key "t_sales", "m_users", column: "charge_code_id", primary_key: "user_code"
  add_foreign_key "t_sales", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_sales_details", "m_products", column: "product_code_id", primary_key: "product_code"
  add_foreign_key "t_sales_details", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "t_sales_details", "t_sales", column: "sale_id"
  add_foreign_key "t_send_order_details", "m_makers", column: "maker_code_id", primary_key: "maker_code"
  add_foreign_key "t_send_order_details", "m_products", column: "product_code_id", primary_key: "product_code"
  add_foreign_key "t_send_order_details", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "t_send_order_details", "t_receive_order_details", column: "receive_order_detail_id"
  add_foreign_key "t_send_order_details", "t_send_orders", column: "send_order_id"
  add_foreign_key "t_send_orders", "m_departments", column: "department_code_id", primary_key: "department_code"
  add_foreign_key "t_send_orders", "m_suppliers", column: "supplier_code_id", primary_key: "supplier_code"
  add_foreign_key "t_send_orders", "m_users", column: "user_code_id", primary_key: "user_code"
  add_foreign_key "t_send_orders", "t_receive_orders", column: "receive_order_id"
end
