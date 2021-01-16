class CreateTDemands < ActiveRecord::Migration[6.0]
  def change
    ##### 請求
    create_table :t_demands do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.date :issue_date, null: false
      t.string :demand_category, null: false
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.date :payment_date, null: false
      t.integer :adjustment_amount, limit: 5, null: false
      t.string :payment_category, null: false
      t.integer :last_demand_amount, limit: 5, null: false
      t.integer :deposit_amount, limit: 5, null: false
      t.boolean :deposited_flag, null: false
      t.date :close_date, null: false
      t.boolean :Invoiced_flag

      t.timestamps
    end
  end
end
