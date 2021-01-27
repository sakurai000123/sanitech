class MSupplier < ApplicationRecord
  belongs_to :charge, class_name: "MUser", optional: true
  belongs_to :input_user, class_name: "MUser", optional: true

  # バリデーション
  validates :supplier_number,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先番号")}

  validates :id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先コード")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "仕入先コード")}

  validates :start_date,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "登録日")}

  validates :department_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "部門")}

  validates :charge_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "担当者")}

  validates :input_user_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "発行者")}

  validates :supplier_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先名")}

  validates :charge_position,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先担当者役職")}

  validates :charge_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先担当者")}

  validates :post_code,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先郵便番号")}

  validates :prefecture,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先都道府県")}

  validates :address1,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "仕入先住所１")}

  validates :address2,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "得意先住所２")}

  validates :phone_number,
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "電話番号")}, allow_blank: true,
  format: { with: Validate::PHONE_NUMBER_REGEX, message: sprintf(Message::FORMAT_ERROR, "電話番号")}

  validates :fax_number,
  format: { with: Validate::PHONE_NUMBER_REGEX, message: sprintf(Message::FORMAT_ERROR, "FAX番号"), allow_blank: true}

  validates :mail_address,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "メールアドレス")},
  format: { with: Validate::EMAIL_REGEX, message: sprintf(Message::FORMAT_ERROR, "メールアドレス"), allow_blank: true}

  validates :payment_category_code,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "支払条件")}

  validates :close_date_code,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "締日")}

  validates :payment_day_code,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "支払日")}

  validates :payment_account_id,
  presence: { message: sprintf(Message::SELECT_BLANK_ERROR, "振込先")}
end
