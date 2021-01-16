class CreateTReceiveOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_receive_order_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :receive_order, null: false, foreign_key: {to_table: :t_receive_orders} 
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.references :order_category_code, type: :string, null: false, foreign_key: {to_table: :m_order_categories, primary_key: :order_category_code} 
      t.text :order_category_name, null: false
      t.boolean :invalid_flag
      t.references :maker_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :maker_code} 
      t.text :maker_name, null: false
      t.references :product_code, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :product_code} 
      t.text :product_name, null: false
      t.text :product_model_number, null: false
      t.references :warehouse_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_warehouses, primary_key: :warehouse_code} 
      t.text :warehouse_name, null: false
      t.integer :receive_order_quantity, limit: 2, null: false
      t.text :product_unit, null: false, null: false
      t.boolean :unit_price_pending_flag
      t.boolean :cost_pending_flag
      t.integer :sale_unit_price, limit: 5, null: false
      t.integer :multiplication_rate, limit: 2, null: false
      t.integer :receive_order_detail_amount, limit: 5, null: false
      t.integer :profit_rate, limit: 2, null: false
      t.integer :list_price, limit: 5, null: false
      t.date :stock_date, null: false
      t.integer :original_unit_price, limit: 5, null: false
      t.integer :cost_price, limit: 5, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.text :supplier_name, null: false
      t.date :delivery_date, null: false
      t.text :note
      t.boolean :spec_detail_flag
      t.text :detail_note
      t.text :detail_memo
      t.integer :pre_recorded, limit: 5
      t.integer :list_price_rate, limit: 2

      t.timestamps
    end
  end
end
