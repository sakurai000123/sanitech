class CreateTAccountPayables < ActiveRecord::Migration[6.0]
  def change
    ##### 買掛帳
    create_table :t_account_payables, id: false do |t|
      t.integer :id, null: false, primary_key: true #買掛帳ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :billing_date, null: false #請求日
      t.references :supplier_id, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #仕入先ID
      t.string :applicable_date, null: false #適用年月
      t.integer :not_payment, null: false #未払い
      t.date :payment_plans_date, null: false #振込予定日
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.integer :amount, null: false #金額
      t.integer :tax_amount, null: false #消費税
      t.integer :total_amount, null: false #合計
      t.integer :erase_amount, null: false #差引合計
      t.date :payment_date, null: false #出金日
      t.integer :payment_amount, null: false #出金額
      t.integer :payment_fee, null: false #出金手数料
      t.integer :offset_amount, null: false #相殺額
      t.integer :balance, null: false #残高
      t.string :demand_no, null: false #請求書No
      
      t.timestamps
    end
  end
end
