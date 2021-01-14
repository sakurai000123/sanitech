class CreateMUsers < ActiveRecord::Migration[6.0]
  def change
    # 社員
    create_table :m_users, id: false do |t|
      t.string :user_code, limit: 4, primary_key: true, null: false
      t.text :create_user_name, null:false
      t.text :update_user_name, null:false
      t.string :authority_code, limit: 3, null:false
      t.string :department_code, limit: 3, null:false
      t.integer :company_car_No, limit: 2
      t.text :family_name, null:false
      t.text :family_name_kana, null:false
      t.text :given_name, null:false
      t.text :given_name_kana, null:false
      t.string :mobile_phone_number, limit: 11
      t.text :mail_address, null:false, unique:true
      t.string :login_id, limit: 20, null:false, unique:true
      t.string :password_digest, limit: 255, null:false, unique:true
      t.date :hire_date, null:false
      t.text :master_key, null:false
      t.text :position, null:false
      t.string :emergency_phone_number, limit: 11, null:false
      t.string :blood_type, null:false
      t.date :medical_examination_date
      t.text :note
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
