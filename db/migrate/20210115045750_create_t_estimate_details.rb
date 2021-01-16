class CreateTEstimateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_estimate_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :estimate, null: false, foreign_key: {to_table: :t_estimates} 
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.references :maker_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :maker_code} 
      t.text :maker_name, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.references :product_code, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :product_code} 
      t.text :product_name, null: false
      t.text :product_model_number, null: false
      t.integer :estimate_quantity, limit: 2, null: false
      t.text :product_unit, null: false
      t.integer :sale_unit_price, limit: 5, null: false
      t.integer :multiplication_rate, limit: 2, null: false
      t.integer :detail_estimate_amount, limit: 5, null: false
      t.integer :list_price, limit: 5, null: false
      t.integer :original_unit_price, limit: 5, null: false
      t.integer :cost_price, limit: 5, null: false
      t.integer :gross_profit_margin, limit: 2, null: false
      t.integer :detail_tax_amount, limit: 5, null: false
      t.text :detail_note
      t.text :details_memo

      t.timestamps
    end
  end
end
