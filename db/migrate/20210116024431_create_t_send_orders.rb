class CreateTSendOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :t_send_orders do |t|
      t.text :create_user_name
      t.text :update_user_name
      t.text :send_order_number
      t.text :send_order_branch_number
      t.date :send_order_date
      t.references :receive_order, null: false, foreign_key: {to_table: :t_receive_orders} 
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.integer :send_order_amount, limit: 5
      t.integer :tax_amount, limit: 2
      t.boolean :completion_flag

      t.timestamps
    end
  end
end
