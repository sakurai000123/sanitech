class CreateTReports < ActiveRecord::Migration[6.0]
  def change
    ##### 報告書
    create_table :t_reports do |t|
      t.string :create_user_name, null: false #作成者
      t.string :update_user_name, null: false #更新者
      t.references :department, type: :string, null: false, foreign_key: {to_table: :m_departments, primary_key: :id} #部門ID
      t.references :user, type: :string, null: false, foreign_key: {to_table: :m_users, primary_key: :id} #社員ID
      t.string :report_type, null: false #書類種別
      t.date :issue_date, null: false #発行日
      t.string :title #題名
      t.string :period #期間
      t.text :overview #概要
      t.text :cause #原因
      t.text :task #課題・問題点
      t.text :countermeasures #今後の予定・対策
      t.references :customer, type: :string, limit: 6, foreign_key: {to_table: :m_customers, primary_key: :id} #得意先ID
      t.string :customer_name #得意先名
      t.string :customer_charge_name #得意先担当者名
      t.text :disposition_contents #始末書内容
      t.boolean :reported_flag #書類発行済フラグ

      t.timestamps
    end
  end
end
