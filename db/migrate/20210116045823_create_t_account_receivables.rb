class CreateTAccountReceivables < ActiveRecord::Migration[6.0]
  def change
    create_table :t_account_receivables do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :billing_date, null: false
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.integer :not_deposit, limit: 5, null: false
      t.string :payment_category, null: false
      t.date :deposit_date, null: false
      t.integer :deposit_amount, limit: 5, null: false
      t.integer :tax_amount, limit: 5, null: false
      t.integer :amount, limit: 5, null: false
      t.integer :offset_amount, limit: 5, null: false
      t.integer :erase_amount, limit: 5, null: false
      t.integer :payment_fee, limit: 5, null: false
      t.integer :balance, limit: 5, null: false
      t.references :demand, null: false, foreign_key: {to_table: :t_demands} 
      t.integer :purchase_amount, limit: 5

      t.timestamps
    end
  end
end
