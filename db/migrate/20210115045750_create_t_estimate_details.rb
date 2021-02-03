class CreateTEstimateDetails < ActiveRecord::Migration[6.0]
  ##### 見積明細
  def change
    create_table :t_estimate_details, id: false do |t|
      t.integer :id, null: false, primary_key: true #見積明細ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :estimate, type: :string, null: false, foreign_key: {to_table: :t_estimates, primary_key: :id} #見積ID
      t.integer :line_number, null: false #行番号
      t.integer :sort_number, null: false #ソート番号
      t.integer :order_category_code, null: false #受注区分CD
      t.string :order_category_name, null: false #受注区分名
      t.references :maker, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_makers, primary_key: :id} #メーカーID
      t.string :maker_name, null: false #メーカー名
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.references :product, type: :string, limit: 8, null: false, foreign_key: {to_table: :m_products, primary_key: :id} #商品ID
      t.string :product_name, null: false #商品名
      t.string :product_model_number, null: false #型番
      t.integer :estimate_quantity, null: false #見積数量
      t.string :product_unit, null: false #単位
      t.integer :sale_unit_price, null: false #単価
      t.integer :multiplication_rate, null: false #掛率
      t.integer :detail_estimate_amount, null: false #見積金額
      t.integer :list_price, null: false #定価
      t.integer :original_unit_price, null: false #原単価
      t.integer :cost_price, null: false #原価金額
      t.integer :gross_profit_margin, null: false #粗利率
      t.integer :detail_tax_amount, null: false #消費税金額
      t.string :spec_detail #仕様詳細
      t.string :detail_note #明細備考
      t.string :details_memo #明細メモ
      t.string :classification_code, limit: 1, null: false #分類CD

      t.timestamps
    end
  end
end
