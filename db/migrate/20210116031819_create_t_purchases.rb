class CreateTPurchases < ActiveRecord::Migration[6.0]
  def change
    ##### 入荷
    create_table :t_purchases do |t|
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :purchase_date, null: false #入荷日
      t.references :supplier_id, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #仕入先ID
      t.string :supplier_name, null: false #仕入先名
      t.references :user_id, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #社員ID
      t.references :send_order_id, type: :string, null: false, foreign_key: {to_table: :t_send_orders, primary_key: :id} #発注ID
      t.integer :purchase_amount, null: false #仕入金額合計
      t.integer :tax_amount, null: false #消費税合計
      t.date :purchase_slip_date #仕入伝票日付

      t.timestamps
    end
  end
end
