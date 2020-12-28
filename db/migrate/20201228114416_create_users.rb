class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 255
      t.string :name_ruby, limit: 255
      t.string :master_key, limit: 255
      t.string :password_digest, null: false, limit: 255
      t.string :employee_no, null: false, limit: 255
      t.date :joined_company_date
      t.string :company_phone, limit: 20
      t.string :company_car_no, limit: 255
      t.string :emergency_contact_phone, limit: 20
      t.string :emergency_contact_name, limit: 255
      t.string :email, limit: 255
      t.string :blood_type, limit: 2
      t.date :health_check_date
      t.text :remarks, limit: 1000

      t.timestamps
      t.index :employee_no, unique: true
    end
  end
end
