class CreateTPayments < ActiveRecord::Migration[6.0]
  def change
    ##### 支払
    create_table :t_payments do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :payment_date, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.string :payment_category, null: false
      t.integer :payment_amount, limit: 5, null: false
      t.integer :tax_amount, limit: 5, null: false
      t.boolean :completion_flag

      t.timestamps
    end
  end
end
