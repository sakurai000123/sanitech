class CreateTDeposits < ActiveRecord::Migration[6.0]
  def change
    ##### 入金
    create_table :t_deposits do |t|
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :deposit_date, null: false #入金日
      t.references :demand, type: :string, null: false, foreign_key: {to_table: :t_demands, primary_key: :id} #請求ID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.references :deposit_account, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_deposit_accounts, primary_key: :id} #入金口座ID
      t.integer :deposit_amount, null: false #入金額
      t.integer :erase_amount, null: false #消込金額
      t.references :account_receivable, type: :integer, null: false, foreign_key: {to_table: :t_account_receivables, primary_key: :id} #売掛帳ID

      t.timestamps
    end
  end
end
