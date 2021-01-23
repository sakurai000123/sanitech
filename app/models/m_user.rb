class MUser < ApplicationRecord
  has_secure_password
  has_one :m_customer
  has_one :m_supplier

  validate :add_user_error
  
  def add_user_error
    if hire_date.blank?
      errors[:base] << "入社日を入力してください"
    end

    if department_id.blank?
      errors[:base] << "部門を選択してください"
    end

    if id.blank?
      errors[:base] << "社員Noを入力してください"
    end

    if login_id.blank?
      errors[:base] << "ログインIDを入力してください"
    end

    if user_name.blank?
      errors[:base] << "氏名を入力してください"
    end

    if master_key.blank?
      errors[:base] << "マスターキーを入力してください"
    end

    if authority_id.blank?
      errors[:base] << "権限を選択してください"
    end

    if affiliation_department.blank?
      errors[:base] << "所属部署を入力してください"
    end

    if position.blank?
      errors[:base] << "役職を入力してください"
    end

    if emergency_phone_number.blank?
      errors[:base] << "緊急連絡先を入力してください"
    end

    if emergency_name.blank?
      errors[:base] << "緊急連絡先名を入力してください"
    end

    if mail_address.blank?
      errors[:base] << "メールアドレスを入力してください"
    end

    if blood_type.blank?
      errors[:base] << "血液型を選択してください"
    end
    
  end
end
