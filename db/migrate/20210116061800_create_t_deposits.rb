class CreateTDeposits < ActiveRecord::Migration[6.0]
  def change
    ##### 入金
    create_table :t_deposits do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :deposit_date, null: false
      t.references :demand, null: false, foreign_key: {to_table: :t_demands} 
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.string :payment_category, null: false
      t.references :deposit_account_code, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_deposit_accounts, primary_key: :deposit_account_code} 
      t.integer :deposit_amount, limit: 5, null: false
      t.integer :erase_amount, limit: 5, null: false

      t.timestamps
    end
  end
end
