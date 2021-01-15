class CreateMSuppliers < ActiveRecord::Migration[6.0]
  def change
    # 仕入先
    create_table :m_suppliers, id: false do |t|
      t.string :supplier_code, limit: 5, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :supplier_number, null: false
      t.date :start_date, null: false
      t.string :department_code, null: false
      t.string :user_code, null: false
      t.text :supplier_name, null: false
      t.text :charge_name, null: false
      t.text :charge_position, null: false
      t.string :post_code, null: false
      t.text :prefecture, null: false
      t.text :address1, null: false
      t.text :address2, null: false
      t.string :phone_number, null: false
      t.string :fax_number, null: false
      t.string :payment_category, null: false
      t.string :close_date, null: false
      t.string :payment_day, null: false
      t.string :payment_account_code, null: false
      t.text :note
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
