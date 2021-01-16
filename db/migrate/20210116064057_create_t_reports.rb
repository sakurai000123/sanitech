class CreateTReports < ActiveRecord::Migration[6.0]
  def change
    ##### 報告書
    create_table :t_reports do |t|
      t.text :create_user_name, null: false
      t.text :update_user_name, null: false
      t.references :department_code, type: :string, limit: 3, null:false, foreign_key: {to_table: :m_departments, primary_key: :department_code} 
      t.references :user_code, type: :string, limit: 4, null: false, foreign_key: {to_table: :m_users, primary_key: :user_code} 
      t.string :report_type, null: false
      t.date :issue_date, null: false
      t.text :title
      t.text :period
      t.text :overview
      t.text :cause
      t.text :task
      t.text :countermeasures
      t.references :customer_code, type: :string, limit: 6, null: false, foreign_key: {to_table: :m_customers, primary_key: :customer_code} 
      t.text :customer_name
      t.text :customer_charge_name
      t.text :disposition_contents
      t.boolean :reported_flag

      t.timestamps
    end
  end
end
