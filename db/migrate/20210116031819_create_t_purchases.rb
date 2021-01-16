class CreateTPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :t_purchases do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :purchase_date, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.text :supplier_name, null: false
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :send_order, null: false, foreign_key: {to_table: :t_send_orders} 
      t.references :receive_order, null: false, foreign_key: {to_table: :t_receive_orders} 
      t.integer :purchase_amount, limit: 5, null: false
      t.integer :tax_amount, limit: 5, null: false
      t.date :purchase_slip_date

      t.timestamps
    end
  end
end
