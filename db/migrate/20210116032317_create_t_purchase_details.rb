class CreateTPurchaseDetails < ActiveRecord::Migration[6.0]
  def change
    ##### 入荷明細
    create_table :t_purchase_details, id: false do |t|
      t.integer :id, null: false, primary_key: true #入荷明細ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :purchase, type: :integer, null: false, foreign_key: {to_table: :t_purchases, primary_key: :id} #入荷ID
      t.integer :line_number, null: false #行番号
      t.integer :sort_number, null: false #ソート番号
      t.references :send_order_details, type: :integer, null: false, foreign_key: {to_table: :t_send_order_details, primary_key: :id} #発注明細ID
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :product_model_number, null: false #型番
      t.integer :purchase_unit_price, null: false #仕入単価
      t.integer :purchase_quantity, null: false #仕入数量
      t.integer :purchase_amount, null: false #仕入金額
      t.date :receive_order_date, null: false #受注日
      t.timestamps
    end
  end
end
