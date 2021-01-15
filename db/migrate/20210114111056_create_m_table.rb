class CreateMTable < ActiveRecord::Migration[6.0]
  
  def change
    ###### 部門
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
    ###### 社員
    create_table :m_users, id: false do |t|
      t.string :user_code, limit: 4, primary_key: true, null: false
      t.text :create_user_name, null:false
      t.text :update_user_name, null:false
      t.string :authority_code, limit: 3, null:false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.integer :company_car_No, limit: 2
      t.text :family_name, null:false
      t.text :family_name_kana, null:false
      t.text :given_name, null:false
      t.text :given_name_kana, null:false
      t.string :mobile_phone_number, limit: 11
      t.text :mail_address, null:false, unique:true
      t.string :login_id, limit: 20, null:false, unique:true
      t.string :password_digest, limit: 255, null:false, unique:true
      t.date :hire_date, null:false
      t.text :master_key, null:false
      t.text :position, null:false
      t.string :emergency_phone_number, limit: 11, null:false
      t.string :blood_type, null:false
      t.date :medical_examination_date
      t.text :note
      t.boolean :delete_flag

      t.timestamps
    end
    
    ###### 得意先
    create_table :m_customers, id: false do |t|
      t.string :customer_code, limit: 6, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :customer_number, null: false
      t.text :customer_name, null: false
      t.text :customer_name_kana, null: false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
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

    ###### 仕入先
    create_table :m_suppliers, id: false do |t|
      t.string :supplier_code, limit: 5, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :supplier_number, null: false
      t.date :start_date, null: false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.references :user_code2, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
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
    
    ##### 受注区分
    create_table :m_order_categories, id: false do |t|
      t.string :order_category_code, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :order_category_name, null: false

      t.timestamps
    end

    ##### メーカー
    create_table :m_makers, id: false do |t|
      t.string :maker_code, limit: 4, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :maker_name, null: false
      t.boolean :delete_flag

      t.timestamps
    end

    ##### 商品
    create_table :m_products, id: false do |t|
      t.string :product_code, limit: 8, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :product_name, null: false
      t.text :product_name_kana, null: false
      t.string :product_category, null: false
      t.text :model_number, null: false
      t.text :unit, null: false
      t.integer :unit_price, limit: 5, null: false
      t.integer :original_unit_price, limit: 5, null: false
      t.integer :cost, limit: 5, null: false
      t.integer :sale_unit_price, limit: 5, null: false
      t.references :supplier_code, type: :string, limit: 5, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :supplier_code} 
      t.references :maker_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :maker_code} 
      t.boolean :delete_flag

      t.timestamps
    end

    ##### 倉庫
    create_table :m_warehouses, id: false do |t|
      t.string :warehouse_code, limit: 4, primary_key: true, null: false
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.text :warehouse_name, null: false
      t.string :warehouse_category, null: false
      t.string :post_code, limit: 7, null: false
      t.text :prefecture, null: false
      t.text :address1, null: false
      t.text :address2, null: false
      t.boolean :delete_flag

      t.timestamps
    end

  end
end
