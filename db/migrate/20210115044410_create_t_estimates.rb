class CreateTEstimates < ActiveRecord::Migration[6.0]
  def change
    # 見積
    create_table :t_estimates do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :estimate_number, null: false
      t.integer :estimate_branch_number, limit: 2, null: false
      t.date :estimate_date, null: false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :charge_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :issuer_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :authorizer_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.text :cus_department_name, null: false
      t.text :cus_charge_name, null: false
      t.string :delivery_date_category, null: false
      t.string :payment_category, null: false
      t.string :delivery_place, null: false
      t.string :estimate_expiration_date, null: false
      t.text :estimate_name, null: false
      t.text :note
      t.integer :estimate_amount, limit: 5, null: false
      t.integer :tax_amount, limit: 5, null: false
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
