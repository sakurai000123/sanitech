class CreateTEstimateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :t_estimate_details do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :t_estimate, foreign_key: true, null: false
      t.integer :line_number, limit: 2, null: false
      t.integer :sort_number, limit: 2, null: false
      t.string :maker_code, limit: 4, null: false
      t.text :maker_name, null: false
      t.string :supplier_code, limit: 5, null: false
      t.string :product_code, limit: 8, null: false
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
