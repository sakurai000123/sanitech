# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DBリセットメモ
# rails db:reset
# ps aux | grep sanitech_dev
# sudo kill 番号
# createdb sanitech_dev -O rails_user
# rails db:migrate

# 以下を実行で作成される
# rails db:seed

# データ削除
# ↓↓↓追記は1行目にする↓↓↓
TSalesDetail.destroy_all # 出荷明細
TSale.destroy_all # 出荷
TPurchaseDetail.destroy_all # 入荷明細
TPurchase.destroy_all # 入荷
TSendOrderDetail.destroy_all # 発注明細
TSendOrder.destroy_all # 発注
TReceiveOrderDetail.destroy_all # 受注明細
TReceiveOrder.destroy_all # 受注
TEstimateDetail.destroy_all # 見積明細
TEstimate.destroy_all # 見積
MWarehouse.destroy_all # 倉庫
MProduct.destroy_all # 商品
MMaker.destroy_all # メーカー
MSupplier.destroy_all # 仕入先
MCustomer.destroy_all # 得意先
MUser.destroy_all # ユーザ（社員）
MAuthority.destroy_all # 権限
MDepartment.destroy_all # 部署（部門）

# 部署（部門）
5.times do |n|
  MDepartment.create(
    id: "00#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    department_name:"部門名#{n + 1}",
    department_name_kana: "ブモン",
    post_code: '1234567',
    prefecture: '千葉県',
    address1: '浦安市',
    address2: '舞浜１−１',
    phone_number: '12345678901'
  )
end

# 権限
5.times do |n|
  MAuthority.create(
    id: "00#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    authority_name: "全権限#{n + 1}"
  )
end

# ユーザ（社員）
5.times do |n|
  MUser.create(
    id: "000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    authority_id: "00#{n + 1}",
    hire_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
    department_id: "00#{n + 1}",
    user_name: "テスト#{n + 1}",
    user_name_kana: "テスト#{n + 1}",
    master_key: "00#{n + 1}",
    affiliation_department: "テスト部署#{n + 1}",
    position: "テスト役職#{n + 1}",
    emergency_phone_number: "0901111111#{n + 1}",
    emergency_name: "test#{n + 1}",
    mail_address: "test#{n + 1}@test.test",
    blood_type: 'A',
    login_id: "000#{n + 1}",
    password: "test#{n + 1}",
    password_confirmation: "test#{n + 1}"
  )
end

# 得意先
5.times do |n|
  MCustomer.create(
    id: "00000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    start_date: DateTime.strptime("09/0#{n + 1}/2009 17:00", "%m/%d/%Y %H:%M"),
    department_id: '001',
    charge_id: '0001',
    input_user_id: '0001',
    customer_name: "株式会社得意先#{n + 1}",
    charge_name: "得意先 山田#{n + 1}",
    charge_position: "取締役#{n + 1}",
    cus_post_code: "123-456#{n + 1}",
    cus_prefecture: "東京都#{n + 1}",
    cus_address1: "渋谷区#{n + 1}",
    cus_address2: "渋谷#{n + 1}",
    phone_number: "03-1234-123#{n + 1}",
    fax_number: "03-9876-543#{n + 1}",
    mail_address: "test#{n + 1}@aaa.bb",
    payment_category_code: '1',
    close_date_code: '1',
    payment_date_code: '1',
    deposit_account_name: "支払い口座名#{n + 1}",
    deposit_account_category_code: "1",
    deposit_account_number: "123456#{n + 1}",
    deposit_account_type_code: "1",
    deposit_account_holder: "テストメイギ#{n + 1}",
    deposit_bank_code: "000#{n + 1}",
    deposit_branch_code: "00#{n + 1}"
  )
end

# 仕入先
5.times do |n|
  MSupplier.create(
    id: "00000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    supplier_number: "0000#{n + 1}",
    start_date: DateTime.strptime("09/0#{n + 1}/2009 17:00", "%m/%d/%Y %H:%M"),
    department_id: '001',
    charge_id: '0001',
    input_user_id: '0001',
    supplier_name: "株式会社仕入先#{n + 1}",
    charge_name: "仕入先 田中#{n + 1}",
    charge_position: "部長#{n + 1}",
    post_code: "123-123#{n + 1}",
    prefecture: "東京都#{n + 1}",
    address1: "新宿区#{n + 1}",
    address2: "新宿#{n + 1}",
    phone_number: "03-1234-123#{n + 1}",
    fax_number: "03-9876-543#{n + 1}",
    mail_address: "test#{n + 1}@aaa.bb",
    payment_category_code: '1',
    close_date_code: '1',
    payment_day_code: '1',
    payment_account_name: "支払い口座名#{n + 1}",
    payment_account_category_code: "1",
    payment_account_number_code: "123456#{n + 1}",
    payment_account_type: "1",
    payment_account_holder: "テストメイギ#{n + 1}",
    payment_bank_code: "000#{n + 1}",
    payment_branch_code: "00#{n + 1}",
    note: "備考#{n + 1}"
  )
end

# メーカー
5.times do |n|
  MMaker.create(
    id: "000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    maker_name: "メーカー#{n + 1}"
  )
end

# 商品
5.times do |n|
  MProduct.create(
    id: "0000000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    product_name: "商品#{n + 1}",
    product_name_kana: "ショウヒン#{n + 1}",
    product_category: "区分#{n + 1}",
    model_number: "test#{n + 1}",
    unit: "個#{n + 1}",
    unit_price: "2000#{n + 1}",
    original_unit_price: "1000#{n + 1}",
    cost: "3000#{n + 1}",
    sale_unit_price: "4000#{n + 1}",
    supplier_id: '000001',
    maker_id: '0001'
  )
end

# 倉庫
5.times do |n|
  MWarehouse.create(
    id: "000#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    warehouse_name: "倉庫#{n + 1}",
    warehouse_category: "区分#{n + 1}",
    post_code: "123-123#{n + 1}",
    prefecture: "東京都#{n + 1}",
    address1: "目黒区#{n + 1}",
    address2: "目黒#{n + 1}"
  )
end

# 見積
3.times do |n|
  TEstimate.create(
    id: "00000#{n + 1}-1",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    estimate_branch_number: 1,
    estimate_date: Date.today,
    department_id: "001",
    charge_id: "0001",
    issuer_id: "0002",
    authorizer_id: "0003",
    customer_id: "000001",
    customer_name: "customer_name",
    cus_department_name: "cus_department_name",
    cus_charge_name: "cus_charge_name",
    delivery_date_category_code: "1",
    payment_category_code: "2",
    delivery_place_code: "3",
    estimate_expiration_code: "4",
    estimate_name: "estimate_name",
    note: "note",
    estimate_amount: 100,
    tax_amount: 200
  )
end

# 見積明細
3.times do |n|
  TEstimateDetail.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    estimate_id: "000001-1",
    line_number: 1,
    sort_number: 2,
    order_category_code: 3,
    order_category_name: "order_category_name",
    maker_id: "0002",
    maker_name: "maker_name",
    supplier_id: "000001",
    product_id: "00000001",
    product_name: "product_name",
    product_model_number: "product_model_number",
    estimate_quantity: 4,
    product_unit: "unit",
    sale_unit_price: 100,
    multiplication_rate: 10,
    detail_estimate_amount: 200,
    list_price: 300,
    original_unit_price: 400,
    cost_price: 500,
    gross_profit_margin: 20,
    detail_tax_amount: 600,
    spec_detail: "spec_detail",
    detail_note: "detail_note",
    details_memo: "details_memo",
    classification_code: "5"
  )
end

# 受注
3.times do |n|
  TReceiveOrder.create(
    id: "#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    receive_order_date: Date.today,
    estimate_id: "000001-1",
    department_id: "001",
    charge_id: "0001",
    assistant_id: "0002",
    customer_id: "000001",
    cus_department_name: "cus_department_name",
    cus_charge_name: "cus_charge_name",
    bill_id: "000002",
    bill_name: "bill_name",
    ship_id: "000003",
    ship_charge_name: "ship_charge_name",
    ship_post_code: "000-0001",
    ship_prefecture: "ship_prefecture",
    ship_address1: "ship_address1",
    ship_address2: "ship_address2",
    ship_phone_number: "00-0000-0001",
    ship_fax_number: "00-0000-0002",
    cus_order_number: "cus_order_number",
    bulk_delivery_flag: false,
    receive_order_name: "receive_order_name",
    aggregate_category_code: "1",
    receive_order_amount: 100,
    tax_amount: 200
  )
end

# 受注明細
3.times do |n|
  TReceiveOrderDetail.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    receive_order_id: "1",
    line_number: 2,
    sort_number: 3,
    order_category_code: 4,
    order_category_name: "order_category_name",
    invalid_flag: false,
    maker_id: "0001",
    maker_name: "maker_name",
    product_id: "00000001",
    product_name: "product_name",
    product_model_number: "product_model_number",
    classification_name: "classification_name",
    warehouse_id: "0001",
    warehouse_name: "warehouse_name",
    receive_order_quantity: 10,
    product_unit: "unit",
    unit_price_pending_flag: false,
    cost_pending_flag: false,
    sale_unit_price: 100,
    multiplication_rate: 20,
    receive_order_detail_amount: 200,
    profit_rate: 30,
    list_price: 300,
    stock_date: Date.today,
    original_unit_price: 400,
    cost_price: 500,
    supplier_id: "000001",
    supplier_name: "supplier_name",
    delivery_date: Date.today,
    note: "note",
    classification_code: 5,
    spec_detail: "spec_detail",
    detail_note: "detail_note",
    detail_memo: "detail_memo",
    pre_recorded: 600,
    list_price_rate: 700,
    special_order_flag: false
  )
end

# 発注
3.times do |n|
  TSendOrder.create(
    id: "#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    send_order_date: Date.today,
    receive_order_id: "1",
    department_id: "001",
    user_id: "0001",
    send_order_amount: 100,
    tax_amount: 200
  )
end

# 発注明細
3.times do |n|
  TSendOrderDetail.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    send_order_id: "1",
    receive_order_detail_id: 1,
    maker_id: "0001",
    maker_name: "maker_name",
    product_id: "00000001",
    product_name: "product_name",
    product_model_number: "product_model_number",
    send_order_quantity: 2,
    product_unit: "unit",
    purchase_unit_price: 100,
    receive_order_detail_amount: 200,
    supplier_id: "000001",
    supplier_name: "supplier_name",
    supplier_charge_name: "supplier_charge_name",
    unit_price: 300,
    delivery_deadline: Date.today,
    send_direct_flag: false,
    customer_id: "000002",
    cus_charge_name: "cus_charge_name",
    cus_post_code: "000-0001",
    cus_prefecture: "cus_prefecture",
    cus_address1: "cus_address1",
    cus_address2: "cus_address2",
    cus_phone_number: "00-0000-0001",
    cus_fax_number: "00-0000-0002",
    note: "note",
    classification: "3",
    bill_flag: false
  )
end

# 入荷
3.times do |n|
  TPurchase.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    purchase_date: Date.today,
    supplier_id: "000001",
    supplier_name: "supplier_name",
    user_id: "0001",
    send_order_id: "1",
    purchase_amount: 100,
    tax_amount: 200,
    purchase_slip_date: Date.today
  )
end

# 入荷明細
3.times do |n|
  TPurchaseDetail.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    purchase_id: 1,
    line_number: 2,
    sort_number: 3,
    send_order_details_id: 1,
    product_id: "00000001",
    product_name: "product_name",
    product_model_number: "product_model_number",
    purchase_unit_price: 100,
    purchase_quantity: 4,
    purchase_amount: 200,
    receive_order_date: Date.today
  )
end

# 出荷
3.times do |n|
  TSale.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    receive_order_id: "1",
    sales_date: Date.today,
    close_date: Date.today,
    department_id: "001",
    charge_id: "0001",
    assistant_id: "0002",
    customer_id: "000001",
    sales_amount: 100,
    tax_amount: 200
  )
end

# 出荷明細
3.times do |n|
  TSalesDetail.create(
    id: n + 1,
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    sales_id: 1,
    line_number: 2,
    sort_number: 3,
    receive_order_detail_id: 1,
    product_id: "00000001",
    product_name: "product_name",
    product_model_number: "product_model_number",
    supplier_id: "000001",
    supplier_name: "supplier_name",
    sale_unit_price: 100,
    ship_quantity: 4,
    product_unit: "200",
    sales_detail_amount: 300,
    sales_category: "5",
    visible_maker_flag: false,
    shipped_flag: false
  )
end

# 返金
# 3.times do |n|
#   TReceiveOrder.create(
#     id: "#{n + 1}",
#     create_user_name: "test#{n + 1}",
#     update_user_name: "test#{n + 1}",
#     a
#   )
# end

# 在庫
# 3.times do |n|
#   TReceiveOrder.create(
#     id: "#{n + 1}",
#     create_user_name: "test#{n + 1}",
#     update_user_name: "test#{n + 1}",
#     a
#   )
# end