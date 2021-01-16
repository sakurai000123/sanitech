class CreateTSales < ActiveRecord::Migration[6.0]
  def change
    create_table :t_sales do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :receive_order, null: false, foreign_key: {to_table: :t_receive_orders} 
      t.date :sales_date, null: false
      t.date :close_date, null: false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :charge_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :assistant_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.integer :sales_amount, limit: 5, null: false
      t.integer :tax_amount, limit: 2, null: false

      t.timestamps
    end
  end
end
