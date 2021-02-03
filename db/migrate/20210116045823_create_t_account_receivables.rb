class CreateTAccountReceivables < ActiveRecord::Migration[6.0]
  def change
    ##### 売掛帳
    create_table :t_account_receivables, id: false do |t|
      t.integer :id, null: false, primary_key: true #売掛帳ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :billing_date, null: false #請求日
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.string :applicable_date, null: false #適用年月
      t.integer :not_deposit, null: false #未入金
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.date :deposit_plans_date, null: false #入金予定日
      t.integer :amount, null: false #金額
      t.integer :tax_amount, null: false #消費税
      t.integer :total_amount, null: false #合計
      t.integer :erase_amount, null: false #差引合計
      t.date :deposit_date, null: false #入金日
      t.integer :deposit_amount, null: false #入金額
      t.integer :payment_fee, null: false #支払手数料
      t.integer :offset_amount, null: false #相殺額
      t.integer :balance, null: false #残高
      t.references :demand, type: :string, null: false, foreign_key: {to_table: :t_demands, primary_key: :id}

      t.timestamps
    end
  end
end
