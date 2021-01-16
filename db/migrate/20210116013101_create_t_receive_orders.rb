class CreateTReceiveOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :t_receive_orders do |t|
      t.text :create_user_name, null:false
      t.text :update_user_name, null:false
      t.text :receive_order_number, null:false
      t.date :receive_order_date, null:false
      t.text :estimate_number, null:false
      t.references :estimate, null: false, foreign_key: {to_table: :t_estimates} 
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :charge_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :assistant_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.text :cus_department_name, null:false
      t.text :cus_charge_name, null:false
      t.references :bill_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.text :bill_name, null:false
      t.references :ship_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.text :ship_charge_name, null:false
      t.string :ship_post_code, limit: 7, null:false
      t.text :ship_prefecture, null:false
      t.text :ship_address1, null:false
      t.text :ship_address2, null:false
      t.string :ship_phone_number, limit: 11, null:false
      t.string :ship_fax_number, limit: 10, null:false
      t.text :cus_order_number, null:false
      t.boolean :bulk_delivery_flag
      t.text :receive_order_name, null:false
      t.string :aggregate_category
      t.integer :receive_order_amount, limit: 5, null:false
      t.integer :tax_amount, limit: 5, null:false

      t.timestamps
    end
  end
end
