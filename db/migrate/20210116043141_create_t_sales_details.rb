class CreateTSalesDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_sales_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :sale, null: false, foreign_key: {to_table: :t_sales} 
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.references :product_code, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :product_code} 
      t.text :product_name, null: false
      t.text :product_model_number, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.text :supplier_name, null: false
      t.integer :sale_unit_price, limit: 5, null: false
      t.integer :ship_quantity, limit: 2, null: false
      t.text :product_unit, null: false
      t.integer :sales_detail_amount, limit: 5, null: false
      t.string :sales_category
      t.boolean :visible_maker_flag
      t.boolean :shipped_flag

      t.timestamps
    end
  end
end
