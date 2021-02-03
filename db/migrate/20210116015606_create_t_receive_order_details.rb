class CreateTReceiveOrderDetails < ActiveRecord::Migration[6.0]
  def change
    ##### 受注明細
    create_table :t_receive_order_details, id: false do |t|
      t.integer :id, null: false, primary_key: true #受注明細ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :receive_order, type: :string, null: false, foreign_key: {to_table: :t_receive_orders, primary_key: :id} #受注ID
      t.integer :line_number, null: false #行番号
      t.integer :sort_number, null: false #ソート番号
      t.integer :order_category_code, null: false #受注区分CD
      t.string :order_category_name, null: false #受注区分名
      t.boolean :invalid_flag #無効フラグ
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.string :maker_name, null: false #メーカー名
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :product_model_number, null: false #型番
      t.string :classification_name, null: false #分類名
      t.references :warehouse, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_warehouses, primary_key: :id} #倉庫ID
      t.string :warehouse_name, null: false #倉庫名
      t.integer :receive_order_quantity, null: false #受注数量
      t.string :product_unit, null: false #単位
      t.boolean :unit_price_pending_flag #単価未決フラグ
      t.boolean :cost_pending_flag #原価未決フラグ
      t.integer :sale_unit_price, null: false #販売単価
      t.integer :multiplication_rate, null: false #掛率
      t.integer :receive_order_detail_amount, null: false #受注金額
      t.integer :profit_rate, null: false #利益率
      t.integer :list_price, null: false #定価
      t.date :stock_date, null: false #入荷予定日
      t.integer :original_unit_price, null: false #原単価
      t.integer :cost_price, null: false #原価金額
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.string :supplier_name, null: false #仕入先名
      t.date :delivery_date, null: false #指定納期
      t.text :note #備考
      t.integer :classification_code, null: false #分類CD
      t.string :spec_detail #仕様詳細
      t.string :detail_note #明細備考
      t.string :detail_memo #明細メモ
      t.integer :pre_recorded #先計上
      t.integer :list_price_rate #定価率
      t.boolean :special_order_flag #特殊受注フラグ

      t.timestamps
    end
  end
end
