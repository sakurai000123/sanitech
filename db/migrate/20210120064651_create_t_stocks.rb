class CreateTStocks < ActiveRecord::Migration[6.0]
  def change
    ##### 在庫
    create_table :t_stocks, id: false do |t|
      t.string :id, null: false, primary_key: true #在庫ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :purchase_date, null: false #入荷日
      t.date :update_date, null: false #更新日
      t.string :stock_category_code, limit: 2, null: false #在庫区分CD
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.string :maker_name, null: false #メーカー名
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :model_number, null: false #型番
      t.integer :stock_quantity, null: false #数量
      t.integer :allowed_stock #引当個数
      t.string :product_unit, null: false #単位
      t.integer :partition_price, null: false #仕切り価格
      t.text :note #備考
      t.boolean :disposal_flag #処分フラグ
      t.references :warehouse, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_warehouses, primary_key: :id} #倉庫ID

      t.timestamps
    end
  end
end
