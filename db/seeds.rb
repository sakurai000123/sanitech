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
User.create(
  name: 'test1',
  name_ruby: 'テストイチ',
  master_key: '0001',
  password: 'test1',
  password_confirmation: 'test1',
  employee_no: '0001'
)
