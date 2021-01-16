class CreateTAccountPayables < ActiveRecord::Migration[6.0]
  def change
    ##### 買掛帳
    create_table :t_account_payables do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :billing_date, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.integer :not_payment, limit: 5, null: false
      t.date :payment_date, null: false
      t.integer :payment_amount, limit: 5, null: false
      t.integer :payment_fee, limit: 5, null: false
      t.string :payment_category, null: false
      t.date :payment_due_date, null: false
      t.integer :amount, limit: 5, null: false
      t.integer :tax_amount, limit: 5, null: false
      t.integer :total_amount, limit: 5, null: false
      t.integer :offset_amount, limit: 5, null: false
      t.integer :erase_amount, limit: 5, null: false
      t.integer :balance, limit: 5, null: false
      t.references :demand, null: false, foreign_key: {to_table: :t_demands} 
      
      t.timestamps
    end
  end
end
