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

# 部署
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
# 得意先
# 仕入先
# 受注区分
# メーカー
# 商品
# 倉庫
