class MUser < ApplicationRecord
  has_one :m_customer
  has_one :m_supplier

  # バリデーション
  validates :hire_date,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "入社日")}

  validates :department_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "部門")}
  
  validates :id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "社員No")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "社員No")}

  validates :login_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "ログインID")}

  has_secure_password validations: false
  validates :password,
  presence: {on: :create, message: sprintf(Message::INPUT_BLANK_ERROR, "パスワード")}

  validates :user_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "氏名")}

  validates :master_key,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "マスターキー")}

  validates :authority_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "権限")}

  validates :affiliation_department,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "所属部署")}

  validates :position,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "役職")}

  validates :mobile_phone_number,
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "社用携帯番号")}, allow_blank: true,
  format: { with: Validate::MOBILE_PHONE_NUMBER_REGEX, message: sprintf(Message::FORMAT_ERROR, "社用携帯番号")}

  validates :emergency_phone_number,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "緊急連絡先")},
  format: { with: Validate::MOBILE_PHONE_NUMBER_REGEX, message: sprintf(Message::FORMAT_ERROR, "緊急連絡先")}

  validates :emergency_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "緊急連絡先名")}

  validates :mail_address,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "メールアドレス")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "メールアドレス")},
  format: { with: Validate::EMAIL_REGEX, message: sprintf(Message::FORMAT_ERROR, "メールアドレス")}

  validates :blood_type,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "血液型")}

end
