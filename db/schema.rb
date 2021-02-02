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

ActiveRecord::Schema.define(version: 2021_01_20_065008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "m_authorities", id: :string, limit: 3, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "authority_name", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_customers", id: :string, limit: 6, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "start_date", null: false
    t.string "department_id", limit: 3, null: false
    t.string "charge_id", limit: 4, null: false
    t.string "input_user_id", limit: 4, null: false
    t.string "customer_name", null: false
    t.string "charge_name", null: false
    t.string "charge_position", null: false
    t.string "cus_post_code", limit: 8, null: false
    t.string "cus_prefecture", null: false
    t.string "cus_address1", null: false
    t.string "cus_address2", null: false
    t.string "phone_number", limit: 13, null: false
    t.string "fax_number", limit: 12
    t.string "mail_address"
    t.string "payment_category_code", limit: 1, null: false
    t.string "close_date_code", limit: 1, null: false
    t.string "payment_date_code", limit: 1, null: false
    t.string "deposit_account_name", null: false
    t.string "deposit_account_category_code", limit: 1, null: false
    t.string "deposit_account_number", limit: 7, null: false
    t.string "deposit_account_type_code", limit: 1, null: false
    t.string "deposit_account_holder", limit: 30, null: false
    t.string "deposit_bank_code", limit: 4, null: false
    t.string "deposit_branch_code", limit: 3, null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charge_id"], name: "index_m_customers_on_charge_id"
    t.index ["department_id"], name: "index_m_customers_on_department_id"
    t.index ["input_user_id"], name: "index_m_customers_on_input_user_id"
  end

  create_table "m_departments", id: :string, limit: 3, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "department_name", null: false
    t.string "department_name_kana", null: false
    t.string "post_code", limit: 8, null: false
    t.string "prefecture", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "phone_number", limit: 13, null: false
    t.string "fax_number", limit: 12
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_makers", id: :string, limit: 4, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "maker_name", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "m_products", id: :string, limit: 8, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "product_name", null: false
    t.string "product_name_kana", null: false
    t.string "product_category", null: false
    t.string "model_number", null: false
    t.string "unit", null: false
    t.integer "unit_price", null: false
    t.integer "original_unit_price", null: false
    t.integer "cost", null: false
    t.integer "sale_unit_price", null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "maker_id", limit: 4, null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_id"], name: "index_m_products_on_maker_id"
    t.index ["supplier_id"], name: "index_m_products_on_supplier_id"
  end

  create_table "m_suppliers", id: :string, limit: 6, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "supplier_number", limit: 5, null: false
    t.date "start_date", null: false
    t.string "department_id", limit: 3, null: false
    t.string "charge_id", limit: 4, null: false
    t.string "input_user_id", limit: 4, null: false
    t.string "supplier_name", null: false
    t.string "charge_name", null: false
    t.string "charge_position", null: false
    t.string "post_code", limit: 8, null: false
    t.string "prefecture", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "phone_number", limit: 13, null: false
    t.string "fax_number", limit: 12
    t.string "mail_address"
    t.string "payment_category_code", limit: 1, null: false
    t.string "close_date_code", limit: 1, null: false
    t.string "payment_day_code", limit: 1, null: false
    t.string "payment_account_name", null: false
    t.string "payment_account_category_code", limit: 1, null: false
    t.string "payment_account_number_code", limit: 7, null: false
    t.string "payment_account_type", limit: 1, null: false
    t.string "payment_account_holder", limit: 30, null: false
    t.string "payment_bank_code", limit: 4, null: false
    t.string "payment_branch_code", limit: 3, null: false
    t.text "note"
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charge_id"], name: "index_m_suppliers_on_charge_id"
    t.index ["department_id"], name: "index_m_suppliers_on_department_id"
    t.index ["input_user_id"], name: "index_m_suppliers_on_input_user_id"
  end

  create_table "m_users", id: :string, limit: 4, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "authority_id", limit: 3, null: false
    t.date "hire_date", null: false
    t.string "department_id", limit: 3, null: false
    t.string "user_name", null: false
    t.string "user_name_kana", null: false
    t.string "master_key", null: false
    t.string "affiliation_department", null: false
    t.string "position", null: false
    t.string "mobile_phone_number", limit: 13
    t.string "company_car_no", limit: 4
    t.string "emergency_phone_number", limit: 11, null: false
    t.string "emergency_name", null: false
    t.string "mail_address", null: false
    t.string "blood_type", limit: 2, null: false
    t.date "medical_examination_date"
    t.text "note"
    t.string "login_id", limit: 20, null: false
    t.string "password_digest", limit: 255, null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authority_id"], name: "index_m_users_on_authority_id"
    t.index ["department_id"], name: "index_m_users_on_department_id"
  end

  create_table "m_warehouses", id: :string, limit: 4, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "warehouse_name", null: false
    t.string "warehouse_category", null: false
    t.string "post_code", limit: 8, null: false
    t.string "prefecture", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "t_account_payables", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "billing_date", null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "applicable_date", null: false
    t.integer "not_payment", null: false
    t.date "payment_plans_date", null: false
    t.string "payment_category_code", limit: 1, null: false
    t.integer "amount", null: false
    t.integer "tax_amount", null: false
    t.integer "total_amount", null: false
    t.integer "erase_amount", null: false
    t.date "payment_date", null: false
    t.integer "payment_amount", null: false
    t.integer "payment_fee", null: false
    t.integer "offset_amount", null: false
    t.integer "balance", null: false
    t.string "demand_no", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_t_account_payables_on_supplier_id"
  end

  create_table "t_account_receivables", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "billing_date", null: false
    t.string "customer_id", limit: 6, null: false
    t.string "applicable_date", null: false
    t.integer "not_deposit", null: false
    t.string "payment_category_code", limit: 1, null: false
    t.date "deposit_plans_date", null: false
    t.integer "amount", null: false
    t.integer "tax_amount", null: false
    t.integer "total_amount", null: false
    t.integer "erase_amount", null: false
    t.date "deposit_date", null: false
    t.integer "deposit_amount", null: false
    t.integer "payment_fee", null: false
    t.integer "offset_amount", null: false
    t.integer "balance", null: false
    t.string "demand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_t_account_receivables_on_customer_id"
    t.index ["demand_id"], name: "index_t_account_receivables_on_demand_id"
  end

  create_table "t_demands", id: :string, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "issue_date", null: false
    t.string "demand_category", null: false
    t.string "receive_order_id", null: false
    t.integer "sales_id", null: false
    t.string "customer_id", limit: 6, null: false
    t.string "user_id", limit: 4, null: false
    t.string "customer_name", null: false
    t.string "cus_charge_name", null: false
    t.string "cus_post_number", limit: 8, null: false
    t.string "cus_prefecture", null: false
    t.string "cus_address1", null: false
    t.string "cus_address2", null: false
    t.date "payment_date", null: false
    t.integer "adjustment_amount", null: false
    t.string "payment_category_code", limit: 1, null: false
    t.integer "last_demand_amount", null: false
    t.integer "deposit_amount", null: false
    t.integer "carry_amount", null: false
    t.integer "purchase_amount", null: false
    t.integer "this_demand_amount", null: false
    t.boolean "deposited_flag", null: false
    t.integer "next_carry_amount", null: false
    t.string "close_date_code", limit: 1, null: false
    t.string "payment_date_code", limit: 1
    t.boolean "Invoiced_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_t_demands_on_customer_id"
    t.index ["receive_order_id"], name: "index_t_demands_on_receive_order_id"
    t.index ["sales_id"], name: "index_t_demands_on_sales_id"
    t.index ["user_id"], name: "index_t_demands_on_user_id"
  end

  create_table "t_deposits", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "deposit_date", null: false
    t.string "demand_id", null: false
    t.string "customer_id", limit: 6, null: false
    t.string "payment_category_code", limit: 1, null: false
    t.integer "deposit_amount", null: false
    t.integer "erase_amount", null: false
    t.integer "account_receivable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_receivable_id"], name: "index_t_deposits_on_account_receivable_id"
    t.index ["customer_id"], name: "index_t_deposits_on_customer_id"
    t.index ["demand_id"], name: "index_t_deposits_on_demand_id"
  end

  create_table "t_estimate_details", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "estimate_id", null: false
    t.integer "line_number", null: false
    t.integer "sort_number", null: false
    t.integer "order_category_code", null: false
    t.string "order_category_name", null: false
    t.string "maker_id", limit: 4, null: false
    t.string "maker_name", null: false
    t.string "supplier_id", limit: 5, null: false
    t.string "product_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "product_model_number", null: false
    t.integer "estimate_quantity", null: false
    t.string "product_unit", null: false
    t.integer "sale_unit_price", null: false
    t.integer "multiplication_rate", null: false
    t.integer "detail_estimate_amount", null: false
    t.integer "list_price", null: false
    t.integer "original_unit_price", null: false
    t.integer "cost_price", null: false
    t.integer "gross_profit_margin", null: false
    t.integer "detail_tax_amount", null: false
    t.string "spec_detail"
    t.string "detail_note"
    t.string "details_memo"
    t.string "classification_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["estimate_id"], name: "index_t_estimate_details_on_estimate_id"
    t.index ["maker_id"], name: "index_t_estimate_details_on_maker_id"
    t.index ["product_id"], name: "index_t_estimate_details_on_product_id"
    t.index ["supplier_id"], name: "index_t_estimate_details_on_supplier_id"
  end

  create_table "t_estimates", id: :string, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.integer "estimate_branch_number", null: false
    t.date "estimate_date", null: false
    t.string "department_id", limit: 3, null: false
    t.string "charge_id", limit: 4, null: false
    t.string "issuer_id", limit: 4, null: false
    t.string "authorizer_id", limit: 4, null: false
    t.string "customer_id", limit: 6, null: false
    t.string "customer_name", null: false
    t.string "cus_department_name", null: false
    t.string "cus_charge_name", null: false
    t.string "delivery_date_category_code", limit: 1, null: false
    t.string "payment_category_code", limit: 1, null: false
    t.string "delivery_place_code", limit: 1, null: false
    t.string "estimate_expiration_code", limit: 1, null: false
    t.string "estimate_name", null: false
    t.text "note"
    t.integer "estimate_amount", null: false
    t.integer "tax_amount", null: false
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authorizer_id"], name: "index_t_estimates_on_authorizer_id"
    t.index ["charge_id"], name: "index_t_estimates_on_charge_id"
    t.index ["customer_id"], name: "index_t_estimates_on_customer_id"
    t.index ["department_id"], name: "index_t_estimates_on_department_id"
    t.index ["issuer_id"], name: "index_t_estimates_on_issuer_id"
  end

  create_table "t_payments", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "payment_date", null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "payment_category_code", limit: 1, null: false
    t.integer "payment_amount", null: false
    t.integer "tax_amount", null: false
    t.boolean "completion_flag"
    t.integer "account_payable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_payable_id"], name: "index_t_payments_on_account_payable_id"
    t.index ["supplier_id"], name: "index_t_payments_on_supplier_id"
  end

  create_table "t_purchase_details", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.integer "purchase_id_id", null: false
    t.integer "line_number", null: false
    t.integer "sort_number", null: false
    t.integer "send_order_details_id_id", null: false
    t.string "product_id_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "product_model_number", null: false
    t.integer "purchase_unit_price", null: false
    t.integer "purchase_quantity", null: false
    t.integer "purchase_amount", null: false
    t.date "receive_order_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id_id"], name: "index_t_purchase_details_on_product_id_id"
    t.index ["purchase_id_id"], name: "index_t_purchase_details_on_purchase_id_id"
    t.index ["send_order_details_id_id"], name: "index_t_purchase_details_on_send_order_details_id_id"
  end

  create_table "t_purchases", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "purchase_date", null: false
    t.string "supplier_id_id", limit: 6, null: false
    t.string "supplier_name", null: false
    t.string "user_id_id", limit: 4, null: false
    t.string "send_order_id_id", null: false
    t.integer "purchase_amount", null: false
    t.integer "tax_amount", null: false
    t.date "purchase_slip_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["send_order_id_id"], name: "index_t_purchases_on_send_order_id_id"
    t.index ["supplier_id_id"], name: "index_t_purchases_on_supplier_id_id"
    t.index ["user_id_id"], name: "index_t_purchases_on_user_id_id"
  end

  create_table "t_receive_order_details", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "receive_order_id", null: false
    t.integer "line_number", null: false
    t.integer "sort_number", null: false
    t.string "order_category_name", null: false
    t.boolean "invalid_flag"
    t.string "maker_id", limit: 4, null: false
    t.string "maker_name", null: false
    t.string "product_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "product_model_number", null: false
    t.string "classification_name", null: false
    t.string "warehouse_id", limit: 4, null: false
    t.string "warehouse_name", null: false
    t.integer "receive_order_quantity", null: false
    t.string "product_unit", null: false
    t.boolean "unit_price_pending_flag"
    t.boolean "cost_pending_flag"
    t.integer "sale_unit_price", null: false
    t.integer "multiplication_rate", null: false
    t.integer "receive_order_detail_amount", null: false
    t.integer "profit_rate", null: false
    t.integer "list_price", null: false
    t.date "stock_date", null: false
    t.integer "original_unit_price", null: false
    t.integer "cost_price", null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "supplier_name", null: false
    t.date "delivery_date", null: false
    t.text "note"
    t.integer "classification_code", null: false
    t.string "spec_detail"
    t.string "detail_note"
    t.string "detail_memo"
    t.integer "pre_recorded"
    t.integer "list_price_rate"
    t.boolean "special_order_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_id"], name: "index_t_receive_order_details_on_maker_id"
    t.index ["product_id"], name: "index_t_receive_order_details_on_product_id"
    t.index ["receive_order_id"], name: "index_t_receive_order_details_on_receive_order_id"
    t.index ["supplier_id"], name: "index_t_receive_order_details_on_supplier_id"
    t.index ["warehouse_id"], name: "index_t_receive_order_details_on_warehouse_id"
  end

  create_table "t_receive_orders", id: :string, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "receive_order_date", null: false
    t.string "estimate_id", null: false
    t.string "department_id", limit: 3, null: false
    t.string "charge_id", limit: 4, null: false
    t.string "assistant_id", limit: 4, null: false
    t.string "customer_id", limit: 6, null: false
    t.string "cus_department_name", null: false
    t.string "cus_charge_name", null: false
    t.string "bill_id", limit: 6, null: false
    t.string "bill_name", null: false
    t.string "ship_id", limit: 6, null: false
    t.string "ship_charge_name", null: false
    t.string "ship_post_code", limit: 8, null: false
    t.string "ship_prefecture", null: false
    t.string "ship_address1", null: false
    t.string "ship_address2", null: false
    t.string "ship_phone_number", limit: 13, null: false
    t.string "ship_fax_number", limit: 12, null: false
    t.string "cus_order_number", null: false
    t.boolean "bulk_delivery_flag"
    t.string "receive_order_name", null: false
    t.string "aggregate_category_code", limit: 1, null: false
    t.integer "receive_order_amount", null: false
    t.integer "tax_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assistant_id"], name: "index_t_receive_orders_on_assistant_id"
    t.index ["bill_id"], name: "index_t_receive_orders_on_bill_id"
    t.index ["charge_id"], name: "index_t_receive_orders_on_charge_id"
    t.index ["customer_id"], name: "index_t_receive_orders_on_customer_id"
    t.index ["department_id"], name: "index_t_receive_orders_on_department_id"
    t.index ["estimate_id"], name: "index_t_receive_orders_on_estimate_id"
    t.index ["ship_id"], name: "index_t_receive_orders_on_ship_id"
  end

  create_table "t_reports", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "department_id", null: false
    t.string "user_id", null: false
    t.string "report_type", null: false
    t.date "issue_date", null: false
    t.string "title"
    t.string "period"
    t.text "overview"
    t.text "cause"
    t.text "task"
    t.text "countermeasures"
    t.string "customer_id", limit: 6
    t.string "customer_name"
    t.string "customer_charge_name"
    t.text "disposition_contents"
    t.boolean "reported_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_t_reports_on_customer_id"
    t.index ["department_id"], name: "index_t_reports_on_department_id"
    t.index ["user_id"], name: "index_t_reports_on_user_id"
  end

  create_table "t_returns", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "return_date", null: false
    t.string "receive_order_id"
    t.string "department_id", null: false
    t.string "charge_id", null: false
    t.string "customer_id", limit: 6, null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "maker_id", limit: 4, null: false
    t.string "maker_name", null: false
    t.string "product_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "model_number", null: false
    t.integer "quantity", null: false
    t.string "unit", null: false
    t.string "returnability", null: false
    t.string "red_slip", null: false
    t.string "invoice_description", null: false
    t.integer "unit_price", null: false
    t.integer "unit_amount", null: false
    t.integer "original_unit_price", null: false
    t.integer "original_unit_amount", null: false
    t.text "return_reason", null: false
    t.boolean "approval_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charge_id"], name: "index_t_returns_on_charge_id"
    t.index ["customer_id"], name: "index_t_returns_on_customer_id"
    t.index ["department_id"], name: "index_t_returns_on_department_id"
    t.index ["maker_id"], name: "index_t_returns_on_maker_id"
    t.index ["product_id"], name: "index_t_returns_on_product_id"
    t.index ["receive_order_id"], name: "index_t_returns_on_receive_order_id"
    t.index ["supplier_id"], name: "index_t_returns_on_supplier_id"
  end

  create_table "t_sales", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "receive_order_id_id", null: false
    t.date "sales_date", null: false
    t.date "close_date", null: false
    t.string "department_id_id", limit: 3, null: false
    t.string "charge_id_id", limit: 4, null: false
    t.string "assistant_id_id", limit: 4, null: false
    t.string "customer_id_id", limit: 6, null: false
    t.integer "sales_amount", null: false
    t.integer "tax_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assistant_id_id"], name: "index_t_sales_on_assistant_id_id"
    t.index ["charge_id_id"], name: "index_t_sales_on_charge_id_id"
    t.index ["customer_id_id"], name: "index_t_sales_on_customer_id_id"
    t.index ["department_id_id"], name: "index_t_sales_on_department_id_id"
    t.index ["receive_order_id_id"], name: "index_t_sales_on_receive_order_id_id"
  end

  create_table "t_sales_details", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.integer "sales_id_id", null: false
    t.integer "line_number", null: false
    t.integer "sort_number", null: false
    t.integer "receive_order_detail_id_id", null: false
    t.string "product_id_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "product_model_number", null: false
    t.string "supplier_id_id", limit: 6, null: false
    t.string "supplier_name", null: false
    t.integer "sale_unit_price", null: false
    t.integer "ship_quantity", null: false
    t.string "product_unit", null: false
    t.integer "sales_detail_amount", null: false
    t.string "sales_category"
    t.boolean "visible_maker_flag"
    t.boolean "shipped_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id_id"], name: "index_t_sales_details_on_product_id_id"
    t.index ["receive_order_detail_id_id"], name: "index_t_sales_details_on_receive_order_detail_id_id"
    t.index ["sales_id_id"], name: "index_t_sales_details_on_sales_id_id"
    t.index ["supplier_id_id"], name: "index_t_sales_details_on_supplier_id_id"
  end

  create_table "t_send_order_details", force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.string "send_order_id", null: false
    t.integer "receive_order_detail_id", null: false
    t.string "maker_id", limit: 4, null: false
    t.string "maker_name", null: false
    t.string "product_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "product_model_number", null: false
    t.integer "send_order_quantity", null: false
    t.string "product_unit", null: false
    t.integer "purchase_unit_price", null: false
    t.integer "receive_order_detail_amount", null: false
    t.string "supplier_id", limit: 6, null: false
    t.string "supplier_name", null: false
    t.string "supplier_charge_name", null: false
    t.integer "unit_price", null: false
    t.date "delivery_deadline", null: false
    t.boolean "send_direct_flag"
    t.string "customer_id", limit: 6
    t.string "cus_charge_name"
    t.string "cus_post_code", limit: 8
    t.string "cus_prefecture"
    t.string "cus_address1"
    t.string "cus_address2"
    t.string "cus_phone_number", limit: 13
    t.string "cus_fax_number", limit: 12
    t.text "note"
    t.string "classification", null: false
    t.boolean "bill_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_t_send_order_details_on_customer_id"
    t.index ["maker_id"], name: "index_t_send_order_details_on_maker_id"
    t.index ["product_id"], name: "index_t_send_order_details_on_product_id"
    t.index ["receive_order_detail_id"], name: "index_t_send_order_details_on_receive_order_detail_id"
    t.index ["send_order_id"], name: "index_t_send_order_details_on_send_order_id"
    t.index ["supplier_id"], name: "index_t_send_order_details_on_supplier_id"
  end

  create_table "t_send_orders", id: :string, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "send_order_date", null: false
    t.string "receive_order_id", null: false
    t.string "department_id", limit: 3, null: false
    t.string "user_id", limit: 4, null: false
    t.integer "send_order_amount", null: false
    t.integer "tax_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_t_send_orders_on_department_id"
    t.index ["receive_order_id"], name: "index_t_send_orders_on_receive_order_id"
    t.index ["user_id"], name: "index_t_send_orders_on_user_id"
  end

  create_table "t_stocks", id: :string, force: :cascade do |t|
    t.string "create_user_name", null: false
    t.string "update_user_name", null: false
    t.date "purchase_date", null: false
    t.date "update_date", null: false
    t.string "stock_category_code", limit: 2, null: false
    t.string "maker_id", limit: 4, null: false
    t.string "maker_name", null: false
    t.string "product_id", limit: 8, null: false
    t.string "product_name", null: false
    t.string "model_number", null: false
    t.integer "stock_quantity", null: false
    t.integer "allowed_stock"
    t.string "product_unit", null: false
    t.integer "partition_price", null: false
    t.text "note"
    t.boolean "disposal_flag"
    t.string "warehouse_id", limit: 4, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_id"], name: "index_t_stocks_on_maker_id"
    t.index ["product_id"], name: "index_t_stocks_on_product_id"
    t.index ["warehouse_id"], name: "index_t_stocks_on_warehouse_id"
  end

  add_foreign_key "m_customers", "m_departments", column: "department_id"
  add_foreign_key "m_customers", "m_users", column: "charge_id"
  add_foreign_key "m_customers", "m_users", column: "input_user_id"
  add_foreign_key "m_products", "m_makers", column: "maker_id"
  add_foreign_key "m_products", "m_suppliers", column: "supplier_id"
  add_foreign_key "m_suppliers", "m_departments", column: "department_id"
  add_foreign_key "m_suppliers", "m_users", column: "charge_id"
  add_foreign_key "m_suppliers", "m_users", column: "input_user_id"
  add_foreign_key "m_users", "m_authorities", column: "authority_id"
  add_foreign_key "m_users", "m_departments", column: "department_id"
  add_foreign_key "t_account_payables", "m_customers", column: "supplier_id"
  add_foreign_key "t_account_receivables", "m_customers", column: "customer_id"
  add_foreign_key "t_account_receivables", "t_demands", column: "demand_id"
  add_foreign_key "t_demands", "m_customers", column: "customer_id"
  add_foreign_key "t_demands", "m_users", column: "user_id"
  add_foreign_key "t_demands", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_demands", "t_sales", column: "sales_id"
  add_foreign_key "t_deposits", "m_customers", column: "customer_id"
  add_foreign_key "t_deposits", "t_account_receivables", column: "account_receivable_id"
  add_foreign_key "t_deposits", "t_demands", column: "demand_id"
  add_foreign_key "t_estimate_details", "m_makers", column: "maker_id"
  add_foreign_key "t_estimate_details", "m_products", column: "product_id"
  add_foreign_key "t_estimate_details", "m_suppliers", column: "supplier_id"
  add_foreign_key "t_estimate_details", "t_estimates", column: "estimate_id"
  add_foreign_key "t_estimates", "m_customers", column: "customer_id"
  add_foreign_key "t_estimates", "m_departments", column: "department_id"
  add_foreign_key "t_estimates", "m_users", column: "authorizer_id"
  add_foreign_key "t_estimates", "m_users", column: "charge_id"
  add_foreign_key "t_estimates", "m_users", column: "issuer_id"
  add_foreign_key "t_payments", "m_suppliers", column: "supplier_id"
  add_foreign_key "t_payments", "t_account_payables", column: "account_payable_id"
  add_foreign_key "t_purchase_details", "m_products", column: "product_id_id"
  add_foreign_key "t_purchase_details", "t_purchases", column: "purchase_id_id"
  add_foreign_key "t_purchase_details", "t_send_order_details", column: "send_order_details_id_id"
  add_foreign_key "t_purchases", "m_suppliers", column: "supplier_id_id"
  add_foreign_key "t_purchases", "m_users", column: "user_id_id"
  add_foreign_key "t_purchases", "t_send_orders", column: "send_order_id_id"
  add_foreign_key "t_receive_order_details", "m_makers", column: "maker_id"
  add_foreign_key "t_receive_order_details", "m_products", column: "product_id"
  add_foreign_key "t_receive_order_details", "m_suppliers", column: "supplier_id"
  add_foreign_key "t_receive_order_details", "m_warehouses", column: "warehouse_id"
  add_foreign_key "t_receive_order_details", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_receive_orders", "m_customers", column: "bill_id"
  add_foreign_key "t_receive_orders", "m_customers", column: "customer_id"
  add_foreign_key "t_receive_orders", "m_customers", column: "ship_id"
  add_foreign_key "t_receive_orders", "m_departments", column: "department_id"
  add_foreign_key "t_receive_orders", "m_users", column: "assistant_id"
  add_foreign_key "t_receive_orders", "m_users", column: "charge_id"
  add_foreign_key "t_receive_orders", "t_estimates", column: "estimate_id"
  add_foreign_key "t_reports", "m_customers", column: "customer_id"
  add_foreign_key "t_reports", "m_departments", column: "department_id"
  add_foreign_key "t_reports", "m_users", column: "user_id"
  add_foreign_key "t_returns", "m_customers", column: "customer_id"
  add_foreign_key "t_returns", "m_departments", column: "department_id"
  add_foreign_key "t_returns", "m_makers", column: "maker_id"
  add_foreign_key "t_returns", "m_products", column: "product_id"
  add_foreign_key "t_returns", "m_suppliers", column: "supplier_id"
  add_foreign_key "t_returns", "m_users", column: "charge_id"
  add_foreign_key "t_returns", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_sales", "m_customers", column: "customer_id_id"
  add_foreign_key "t_sales", "m_departments", column: "department_id_id"
  add_foreign_key "t_sales", "m_users", column: "assistant_id_id"
  add_foreign_key "t_sales", "m_users", column: "charge_id_id"
  add_foreign_key "t_sales", "t_receive_orders", column: "receive_order_id_id"
  add_foreign_key "t_sales_details", "m_products", column: "product_id_id"
  add_foreign_key "t_sales_details", "m_suppliers", column: "supplier_id_id"
  add_foreign_key "t_sales_details", "t_receive_order_details", column: "receive_order_detail_id_id"
  add_foreign_key "t_sales_details", "t_sales", column: "sales_id_id"
  add_foreign_key "t_send_order_details", "m_customers", column: "customer_id"
  add_foreign_key "t_send_order_details", "m_makers", column: "maker_id"
  add_foreign_key "t_send_order_details", "m_products", column: "product_id"
  add_foreign_key "t_send_order_details", "m_suppliers", column: "supplier_id"
  add_foreign_key "t_send_order_details", "t_receive_order_details", column: "receive_order_detail_id"
  add_foreign_key "t_send_order_details", "t_send_orders", column: "send_order_id"
  add_foreign_key "t_send_orders", "m_departments", column: "department_id"
  add_foreign_key "t_send_orders", "m_users", column: "user_id"
  add_foreign_key "t_send_orders", "t_receive_orders", column: "receive_order_id"
  add_foreign_key "t_stocks", "m_makers", column: "maker_id"
  add_foreign_key "t_stocks", "m_products", column: "product_id"
  add_foreign_key "t_stocks", "m_warehouses", column: "warehouse_id"
end
