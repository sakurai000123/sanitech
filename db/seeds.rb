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

# 権限作成
MAuthority.create(
  id: '001',
  create_user_name: "test1",
  update_user_name: "test1",
  authority_name: '全権限'
)

# ユーザ作成（社員）
MUser.create(
  id: '0001',
  create_user_name: 'test1',
  update_user_name: 'test1',
  authority_id: '001',
  hire_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  department_id: '001',
  user_name: 'テスト',
  user_name_kana: 'テスト',
  master_key: '001',
  affiliation_department: 'テスト部署',
  position: 'テスト役職',
  emergency_phone_number: '09011111111',
  emergency_name: 'test2',
  mail_address: 'test1@test.test',
  blood_type: 'A',
  login_id: '0001',
  password: 'test1',
  password_confirmation: 'test1'
)

# 入金口座
5.times do |n|
  MDepositAccount.create(
    id: "00#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    deposit_account_name: "赤色銀行#{n + 1}",
    start_date: DateTime.strptime("09/0#{n + 1}/2009 17:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("09/0#{n + 1}/2012 17:00", "%m/%d/%Y %H:%M"),
    account_category_code: '1',
    account_number: "000000#{n + 1}",
    account_type_code: '1',
    account_holder: "株式会社123#{n + 1}",
    bank_code: "123#{n + 1}",
    branch_code: "11#{n + 1}"
  )
end

# 支払口座
5.times do |n|
  MPaymentAccount.create(
    id: "00#{n + 1}",
    create_user_name: "test#{n + 1}",
    update_user_name: "test#{n + 1}",
    payment_account_name: "青色銀行#{n + 1}",
    start_date: DateTime.strptime("09/0#{n + 1}/2009 17:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("09/0#{n + 1}/2012 17:00", "%m/%d/%Y %H:%M"),
    account_category_code: '1',
    account_number_code: "000000#{n + 1}",
    account_type: '1',
    account_holder: "株式会社123#{n + 1}",
    bank_code: "123#{n + 1}",
    branch_code: "11#{n + 1}"
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
    deposit_account_id: '001'
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
    payment_account_id: '001',
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