class CreateTReturns < ActiveRecord::Migration[6.0]
  def change
    ##### 返品
    create_table :t_returns, id: false do |t|
      t.integer :id, null: false, primary_key: true #返品ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :return_date, null: false #返品日
      t.references :receive_order, type: :string, foreign_key: {to_table: :t_receive_orders, primary_key: :id} #受注ID
      t.references :department, type: :string, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.string :maker_name, null: false #メーカー名
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :model_number, null: false #型番
      t.integer :quantity, null: false #数量
      t.string :unit, null: false #単位
      t.string :returnability, null: false #返品可否
      t.string :red_slip, null: false #赤伝
      t.string :invoice_description, null: false #請求書記載
      t.integer :unit_price, null: false #単価
      t.integer :unit_amount, null: false #単価合計
      t.integer :original_unit_price, null: false #原単価
      t.integer :original_unit_amount, null: false #原単価合計
      t.text :return_reason, null: false #返品理由
      t.boolean :approval_flag #承認フラグ

      t.timestamps
    end
  end
end
