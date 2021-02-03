class CreateTPayments < ActiveRecord::Migration[6.0]
  def change
    ##### 支払
    create_table :t_payments, id: false do |t|
      t.integer :id, null: false, primary_key: true #支払ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.date :payment_date, null: false #支払日
      t.references :supplier, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_suppliers, primary_key: :id} #支払先ID
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.integer :payment_amount, null: false #支払金額
      t.integer :tax_amount, null: false #消費税金額
      t.boolean :completion_flag #完了フラグ
      t.references :account_payable, type: :integer, null: false, foreign_key: {to_table: :t_account_payables, primary_key: :id} #買掛帳ID

      t.timestamps
    end
  end
end
