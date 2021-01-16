class CreateTPurchaseDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_purchase_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :purchase, null: false, foreign_key: {to_table: :t_purchases} 
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.references :send_order_detail, null: false, foreign_key: {to_table: :t_send_order_details} 
      t.references :product_code, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :product_code} 
      t.text :product_name, null: false
      t.text :product_model_number, null: false
      t.integer :purchase_unit_price, limit: 5, null: false
      t.integer :purchase_quantity, limit: 2, null: false
      t.integer :purchase_amount, limit: 5, null: false
      t.date :receive_order_date, null: false

      t.timestamps
    end
  end
end
