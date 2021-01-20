class CreateTDemands < ActiveRecord::Migration[6.0]
  def change
    ##### 請求
    create_table :t_demands, id: false do |t|
      t.string :id, null: false, primary_key: true #請求ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :issue_date, null: false #発行日
      t.string :demand_category, null: false #請求区分
      t.references :receive_order, type: :string, null: false, foreign_key: {to_table: :t_receive_orders, primary_key: :id} #受注ID
      t.references :sales, type: :integer, null: false, foreign_key: {to_table: :t_sales, primary_key: :id} #出荷ID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.references :user, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.string :customer_name, null: false #得意先名
      t.string :cus_charge_name, null: false #得意先担当者名
      t.string :cus_post_number, limit: 8, null: false #得意先郵便番号
      t.string :cus_prefecture, null: false #得意先都道府県
      t.string :cus_address1, null: false #得意先住所1
      t.string :cus_address2, null: false #得意先住所2
      t.date :payment_date, null: false #支払日
      t.integer :adjustment_amount, null: false #調整金額
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.integer :last_demand_amount, null: false #前回請求金額
      t.integer :deposit_amount, null: false #入金額
      t.integer :carry_amount, null: false #繰越金額
      t.integer :purchase_amount, null: false #買上金額
      t.integer :this_demand_amount, null: false #今回請求金額
      t.boolean :deposited_flag, null: false #入金済フラグ
      t.integer :next_carry_amount, null: false #次回繰越金額
      t.string :close_date_code, limit: 1, null: false #締日CD
      t.string :payment_date_code, limit: 1 #支払日CD
      t.boolean :Invoiced_flag #請求書発行済フラグ

      t.timestamps
    end
  end
end
