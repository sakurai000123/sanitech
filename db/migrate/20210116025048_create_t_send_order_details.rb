class CreateTSendOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_send_order_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :send_order, null: false, foreign_key: {to_table: :t_send_orders} 
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.references :receive_order_detail, null: false, foreign_key: {to_table: :t_receive_order_details} 
      t.references :maker_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :maker_code} 
      t.text :maker_name, null: false
      t.references :product_code, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :product_code} 
      t.text :product_name, null: false
      t.text :product_model_number, null: false
      t.integer :send_order_quantity, limit: 2, null: false
      t.text :product_unit, null: false
      t.integer :purchase_unit_price, limit: 5, null: false
      t.integer :receive_order_detail_amount, limit: 5, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.text :supplier_name, null: false
      t.text :supplier_charge_name, null: false
      t.integer :unit_price, limit: 5, null: false
      t.date :delivery_deadline, null: false
      t.boolean :send_direct_flag
      t.string :customer_code, limit: 6
      t.text :cus_charge_name
      t.string :cus_post_code, limit: 7
      t.text :cus_prefecture
      t.text :cus_address1
      t.text :cus_address2
      t.string :cus_phone_number, limit: 11
      t.string :cus_fax_number, limit: 10
      t.text :note
      t.boolean :bill_flag

      t.timestamps
    end
  end
end
