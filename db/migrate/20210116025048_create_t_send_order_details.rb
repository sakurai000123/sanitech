class CreateTSendOrderDetails < ActiveRecord::Migration[6.0]
  ##### 発注明細
  def change
    create_table :t_send_order_details, id: false do |t|
      t.integer :id, null: false, primary_key: true #発注明細ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :send_order, type: :string, null: false, foreign_key: {to_table: :t_send_orders, primary_key: :id} #発注ID
      t.references :receive_order_detail, type: :integer, null: false, foreign_key: {to_table: :t_receive_order_details, primary_key: :id} #受注明細ID
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.string :maker_name, null: false #メーカー名
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :product_model_number, null: false #型番
      t.integer :send_order_quantity, null: false #発注数量
      t.string :product_unit, null: false #単位
      t.integer :purchase_unit_price, null: false #仕入単価
      t.integer :receive_order_detail_amount, null: false #受注金額
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.string :supplier_name, null: false #仕入先名
      t.string :supplier_charge_name, null: false #仕入先担当者名
      t.integer :unit_price, null: false #単価
      t.date :delivery_deadline, null: false #指定納期
      t.boolean :send_direct_flag #直送フラグ
      t.references :customer, type: :string, limit: 6, foreign_key: {to_table: :m_customers, primary_key: :id} #納品先ID
      t.string :cus_charge_name #納品先担当者名
      t.string :cus_post_code, limit: 8 #納品先郵便番号
      t.string :cus_prefecture #納品先都道府県
      t.string :cus_address1 #納品先住所1
      t.string :cus_address2 #納品先住所2
      t.string :cus_phone_number, limit: 13 #納品先電話番号
      t.string :cus_fax_number, limit: 12 #納品先FAX
      t.text :note #備考
      t.string :classification, null: false #分類
      t.boolean :bill_flag #注文書出力フラグ

      t.timestamps
    end
  end
end
