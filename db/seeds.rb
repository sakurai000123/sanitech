# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 以下を実行で作成される
# rails db:seed

# ユーザ作成
MUser.create(
  user_code: '0001',
  create_user_name: 'test1',
  update_user_name: 'test1',
  authority_code: '001',
  department_code: '001',
  family_name: 'テスト',
  family_name_kana: 'テスト',
  given_name: '太郎',
  given_name_kana: 'タロウ',
  mail_address: 'test1@test.test',
  login_id: '0001',
  password: 'test1',
  password_confirmation: 'test1',
  hire_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  master_key: '0001',
  position: 'test',
  emergency_phone_number: '09012341234',
  blood_type: 'A'
)
