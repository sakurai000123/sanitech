class CreateMCustomers < ActiveRecord::Migration[6.0]
  def change
    # 得意先
    create_table :m_customers, id: false do |t|
      t.string :customer_code, limit: 6, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :customer_number, null: false
      t.text :customer_name, null: false
      t.text :customer_name_kana, null: false
      t.string :department_code, limit: 3, null: false
      t.string :user_code, limit: 4, null: false
      t.text :charge_name, null: false
      t.text :charge_name_kana, null: false
      t.text :charge_position, null: false
      t.string :cus_post_code, limit: 7, null: false
      t.text :cus_prefecture, null: false
      t.text :cus_address1, null: false
      t.text :cus_address2, null: false
      t.string :phone_number, limit: 11, null: false
      t.string :fax_number, limit: 10
      t.text :mail_address
      t.string :payment_category, null: false
      t.string :close_date, null: false
      t.string :payment_date, null: false
      t.string :deposit_account_code, limit: 3, null: false
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
