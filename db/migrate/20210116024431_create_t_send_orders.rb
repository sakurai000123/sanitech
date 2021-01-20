class CreateTSendOrders < ActiveRecord::Migration[6.0]
  def change
    ##### 発注
    create_table :t_send_orders, id: false do |t|
      t.string :id, null: false, primary_key: true #発注ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :send_order_date, null: false #発注日
      t.references :receive_order, type: :string, null: false, foreign_key: {to_table: :t_receive_orders, primary_key: :id} #受注ID
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :user, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.integer :send_order_amount, null: false #発注金額合計
      t.integer :tax_amount, null: false #消費税合計

      t.timestamps
    end
  end
end
