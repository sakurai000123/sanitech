class CreateTEstimates < ActiveRecord::Migration[6.0]
  def change
    ###### 見積
    create_table :t_estimates, id: false  do |t|
      t.string :id, null: false, primary_key: true #見積ID
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.integer :estimate_branch_number, limit: 3, null: false #枝番
      t.date :estimate_date, null: false #見積日
      t.references :department, type: :string, limit: 3, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :charge, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #担当者ID
      t.references :issuer, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #発行者ID
      t.references :authorizer, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #承認者ID
      t.references :customer, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.string :customer_name, null: false #得意先名
      t.string :cus_department_name, null: false #得意先部署名
      t.string :cus_charge_name, null: false #得意先担当者名
      t.string :delivery_date_category_code, limit: 1, null: false #納期CD
      t.string :payment_category_code, limit: 1, null: false #支払方法CD
      t.string :delivery_place_code, limit: 1, null: false #受渡場所CD
      t.string :estimate_expiration_code, limit: 1, null: false #見積有効期限CD
      t.string :estimate_name, null: false #見積名
      t.text :note #備考
      t.integer :estimate_amount, null: false #見積金額合計
      t.integer :tax_amount, null: false #消費税合計
      t.boolean :delete_flag #削除フラグ

      t.timestamps
    end
  end
end
