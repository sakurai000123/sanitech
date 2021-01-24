class MUser < ApplicationRecord
  has_one :m_customer
  has_one :m_supplier

  # バリデーション
  validates :hire_date,
  presence: { message: sprintf(Message::INPUT_BLANK, "入社日")}

  validates :department_id,
  presence: { message: sprintf(Message::SELECT_BLANK, "部門")}
  
  validates :id,
  presence: { message: sprintf(Message::INPUT_BLANK, "社員No")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS, "社員No")}

  validates :login_id,
  presence: { message: sprintf(Message::INPUT_BLANK, "ログインID")}

  has_secure_password validations: false
  validates :password,
  presence: {on: :create, message: sprintf(Message::INPUT_BLANK, "パスワード")}

  validates :user_name,
  presence: { message: sprintf(Message::INPUT_BLANK, "氏名")}

  validates :master_key,
  presence: { message: sprintf(Message::INPUT_BLANK, "マスターキー")}

  validates :authority_id,
  presence: { message: sprintf(Message::SELECT_BLANK, "権限")}

  validates :affiliation_department,
  presence: { message: sprintf(Message::INPUT_BLANK, "所属部署")}

  validates :position,
  presence: { message: sprintf(Message::INPUT_BLANK, "役職")}

  validates :emergency_phone_number,
  presence: { message: sprintf(Message::INPUT_BLANK, "緊急連絡先")}

  validates :mobile_phone_number,
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS, "社用携帯番号")}, allow_blank: true

  validates :emergency_name,
  presence: { message: sprintf(Message::INPUT_BLANK, "緊急連絡先名")}

  validates :mail_address,
  presence: { message: sprintf(Message::INPUT_BLANK, "メールアドレス")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS, "メールアドレス")}

  validates :blood_type,
  presence: { message: sprintf(Message::SELECT_BLANK, "血液型")}

end
