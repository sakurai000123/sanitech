class CreateTSalesDetails < ActiveRecord::Migration[6.0]
  def change
    ##### 出荷明細
    create_table :t_sales_details, id: false do |t|
      t.integer :id, null: false, primary_key: true #出荷明細ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :sales, type: :integer, null: false, foreign_key: {to_table: :t_sales, primary_key: :id} #出荷ID
      t.integer :line_number, null: false #行番号
      t.integer :sort_number, null: false #ソート番号
      t.references :receive_order_detail, type: :integer, null: false, foreign_key: {to_table: :t_receive_order_details, primary_key: :id} #受注明細
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :product_model_number, null: false #型番
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.string :supplier_name, null: false #仕入先名
      t.integer :sale_unit_price, null: false #販売単価
      t.integer :ship_quantity, null: false #出荷数量
      t.string :product_unit, null: false #単位
      t.integer :sales_detail_amount, null: false #金額合計
      t.string :sales_category #売上区分
      t.boolean :visible_maker_flag #メーカー非表示フラグ
      t.boolean :shipped_flag #出荷済フラグ

      t.timestamps
    end
  end
end
