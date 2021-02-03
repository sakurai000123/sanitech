class CreateTSales < ActiveRecord::Migration[6.0]
  def change
    ##### 出荷
    create_table :t_sales, id: false do |t|
      t.integer :id, null: false, primary_key: true #出荷ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :receive_order, type: :string, null: false, foreign_key: {to_table: :t_receive_orders, primary_key: :id} #受注ID
      t.date :sales_date, null: false #出荷日
      t.date :close_date, null: false #締日
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :assistant, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #アシスタントID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.integer :sales_amount, null: false #売上金額合計
      t.integer :tax_amount, null: false #消費税合計

      t.timestamps
    end
  end
end
