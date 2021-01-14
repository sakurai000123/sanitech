class CreateMDepartments < ActiveRecord::Migration[6.0]
  def change
    # 部門
    create_table :m_departments, id: false do |t|
      t.string :department_code, limit: 3, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :department_name, null: false
      t.text :department_name_kana, null: false
      t.integer :depth, limit: 2, null: false
      t.string :parent_department_code, limit: 3, null: false
      t.string :post_code, limit: 7, null: false
      t.text :prefecture, null: false
      t.text :address1, null: false
      t.text :address2, null: false
      t.string :phone_number, limit: 11, null: false
      t.string :fax_number, limit: 10
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
