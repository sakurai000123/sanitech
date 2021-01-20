class CreateTReceiveOrders < ActiveRecord::Migration[6.0]
  def change
    ##### 受注
    create_table :t_receive_orders, id: false do |t|
      t.string :id, null: false, primary_key: true #受注ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :receive_order_date, null: false #受注日
      t.references :estimate, type: :string, null: false, foreign_key: {to_table: :t_estimates, primary_key: :id} #見積ID
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :assistant, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #アシスタントID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.string :cus_department_name, null: false #得意先部署名
      t.string :cus_charge_name, null: false #得意先担当者名
      t.references :bill, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #請求先ID
      t.string :bill_name, null: false #請求先名
      t.references :ship, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #出荷先ID
      t.string :ship_charge_name, null: false #出荷先担当者名
      t.string :ship_post_code, limit: 8, null: false #出荷先郵便番号
      t.string :ship_prefecture, null: false #出荷先都道府県
      t.string :ship_address1, null: false #出荷先住所1
      t.string :ship_address2, null: false #出荷先住所2
      t.string :ship_phone_number, limit: 13, null: false #出荷先TEL
      t.string :ship_fax_number, limit: 12, null: false #出荷先FAX
      t.string :cus_order_number, null: false #客先注文番号
      t.boolean :bulk_delivery_flag #一括納品フラグ
      t.string :receive_order_name, null: false #受注名
      t.string :aggregate_category_code, limit: 1, null: false #集計分類CD
      t.integer :receive_order_amount, null: false #受注金額合計
      t.integer :tax_amount, null: false #消費税合計

      t.timestamps
    end
  end
end
