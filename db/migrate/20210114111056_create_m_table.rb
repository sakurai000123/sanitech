class CreateMTable < ActiveRecord::Migration[6.0]
  
  def change
    ###### 部門
    create_table :m_departments, id: false do |t|
      t.string :id, limit: 3, null: false, primary_key: true #部門ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :department_name, null: false #部門名
      t.string :department_name_kana, null: false #部門名カナ
      t.string :post_code, limit: 8, null: false #郵便番号
      t.string :prefecture, null: false #都道府県
      t.string :address1, null: false #住所1
      t.string :address2, null: false #住所2
      t.string :phone_number, limit: 13, null: false #電話番号
      t.string :fax_number, limit: 12 #FAX番号
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ###### 権限
    create_table :m_authorities, id: false do |t|
      t.string :id, limit: 3, null: false, primary_key: true #権限ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :authority_name, null: false #権限名
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ###### 社員
    create_table :m_users, id: false do |t|
      t.string :id, limit: 4, null: false, primary_key: true #社員ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :authority, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_authorities, primary_key: :id} #権限ID
      t.date :hire_date, null: false #入社日
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.string :user_name, null: false #氏名
      t.string :user_name_kana, null: false #氏名カナ
      t.string :master_key, null: false #マスタキー
      t.string :affiliation_department, null: false #所属部署
      t.string :position, null: false #役職
      t.string :mobile_phone_number, limit: 13, unique:true #携帯電話番号
      t.string :company_car_no, limit: 4 #社用車No
      t.string :emergency_phone_number, limit: 11, null: false #緊急連絡先
      t.string :emergency_name, null: false #緊急連絡先名
      t.string :mail_address, null: false, unique:true #メールアドレス
      t.string :blood_type, limit: 2, null: false #血液型
      t.date :medical_examination_date #健康診断実施日
      t.text :note #備考
      t.string :login_id, limit: 20, null: false, unique:true #ログインID
      t.string :password_digest, limit: 255, null: false #パスワード
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end
    
    ###### 得意先
    create_table :m_customers, id: false do |t|
      t.string :id, limit: 6, null: false, primary_key: true #得意先ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :start_date, null: false #登録日
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :input_user, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #入力者ID
      t.string :customer_name, null: false #得意先名
      t.string :charge_name, null: false #得意先担当者名
      t.string :charge_position, null: false #得意先担当者役職
      t.string :cus_post_code, limit: 8, null: false #郵便番号
      t.string :cus_prefecture, null: false #都道府県
      t.string :cus_address1, null: false #住所1
      t.string :cus_address2, null: false #住所2
      t.string :phone_number, limit: 13, null: false #電話番号
      t.string :fax_number, limit: 12 #FAX番号
      t.string :mail_address #メールアドレス
      t.string :payment_category_code, limit: 1, null: false #支払条件CD
      t.string :close_date_code, limit: 1, null: false #締日CD
      t.string :payment_date_code, limit: 1, null: false #支払日CD
      t.string :deposit_account_name, null: false #入金口座名
      t.string :deposit_account_category_code, limit: 1, null: false #口座区分CD
      t.string :deposit_account_number, limit: 7, null: false #口座番号
      t.string :deposit_account_type_code, limit: 1, null: false #口座種別CD
      t.string :deposit_account_holder, limit: 30, null: false #口座名義
      t.string :deposit_bank_code, limit: 4, null: false #銀行コード
      t.string :deposit_branch_code, limit: 3, null: false #支店コード
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ###### 仕入先
    create_table :m_suppliers, id: false do |t|
      t.string :id, limit: 6, null: false, primary_key: true #仕入先ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :supplier_number, limit: 5, null: false #仕入先番号
      t.date :start_date, null: false #登録日
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :input_user, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #入力者ID
      t.string :supplier_name, null: false #仕入先名
      t.string :charge_name, null: false #仕入先担当者名
      t.string :charge_position, null: false #仕入先担当者役職
      t.string :post_code, limit: 8, null: false #郵便番号
      t.string :prefecture, null: false #都道府県
      t.string :address1, null: false #住所1
      t.string :address2, null: false #住所2
      t.string :phone_number, limit: 13, null: false #電話番号
      t.string :fax_number, limit: 12 #FAX番号
      t.string :mail_address #メールアドレス
      t.string :payment_category_code, limit: 1, null: false #支払条件CD
      t.string :close_date_code, limit: 1, null: false #締日CD
      t.string :payment_day_code, limit: 1, null: false #支払日CD
      t.string :payment_account_name, null: false #支払口座名
      t.string :payment_account_category_code, limit: 1, null: false #口座区分CD
      t.string :payment_account_number_code, limit: 7, null: false #口座番号
      t.string :payment_account_type, limit: 1, null: false #口座種別CD
      t.string :payment_account_holder, limit: 30, null: false #口座名義
      t.string :payment_bank_code, limit: 4, null: false #銀行コード
      t.string :payment_branch_code, limit: 3, null: false #支店コード
      t.text :note #備考
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ##### メーカー
    create_table :m_makers, id: false do |t|
      t.string :id, limit: 4, null: false, primary_key: true #メーカーID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :maker_name, null: false #メーカー名
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ##### 商品
    create_table :m_products, id: false do |t|
      t.string :id, limit: 8, null: false, primary_key: true #商品ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :product_name, null: false #商品名
      t.string :product_name_kana, null: false #商品名カナ
      t.string :product_category, null: false #商品区分
      t.string :model_number, null: false #製品型番
      t.string :unit, null: false #単位
      t.integer :unit_price, null: false #単価
      t.integer :original_unit_price, null: false #原単価
      t.integer :cost, null: false #原価
      t.integer :sale_unit_price, null: false #定価
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

    ##### 倉庫
    create_table :m_warehouses, id: false do |t|
      t.string :id, limit: 4, null: false, primary_key: true #倉庫ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.string :warehouse_name, null: false #倉庫名
      t.string :warehouse_category, null: false #倉庫区分
      t.string :post_code, limit: 8, null: false #郵便番号
      t.string :prefecture, null: false #都道府県
      t.string :address1, null: false #住所1
      t.string :address2, null: false #住所2
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end

  end
end
