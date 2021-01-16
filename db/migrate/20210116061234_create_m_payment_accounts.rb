class CreateMPaymentAccounts < ActiveRecord::Migration[6.0]
  def change
    ##### 支払口座
    create_table :m_payment_accounts, id: false do |t|
      t.string :payment_account_code, limit: 3, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :payment_account_name, null: false
      t.date :start_date
      t.date :end_date
      t.string :account_category, null: false
      t.string :account_number, limit: 7, null: false
      t.string :account_type, null: false
      t.string :account_holder, limit: 30, null: false
      t.string :bank_code, limit: 4, null: false
      t.string :branch_code, limit: 3, null: false
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
