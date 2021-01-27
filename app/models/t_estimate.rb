class TEstimate < ApplicationRecord
  has_many :t_estimate_details, dependent: :destroy

  # バリデーション
  validates :id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "見積ID")},
  uniqueness: { message: sprintf(Message::RECORD_UNIQUENESS_ERROR, "見積ID")}

  validates :create_user_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "作成者")}

  validates :update_user_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "更新者")}

  validates :estimate_branch_number,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "枝番")}

  validates :estimate_date,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "見積日")}

  validates :department_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "部門ID")}

  validates :charge_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "担当者ID")}

  validates :issuer_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "発行者ID")}

  validates :authorizer_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "承認者ID")}

  validates :customer_id,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "得意先ID")}

  validates :customer_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "得意先名")}

  validates :cus_department_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "得意先部署名")}

  validates :cus_charge_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "得意先担当者名")}

  validates :delivery_date_category_code,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "納期")}

  validates :payment_category_code,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "支払方法")}

  validates :delivery_place_code,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "受渡場所")}

  validates :estimate_expiration_code,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "見積有効期限")}

  validates :estimate_name,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "件名")}

  validates :estimate_amount,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "見積金額合計")}

  validates :tax_amount,
  presence: { message: sprintf(Message::INPUT_BLANK_ERROR, "消費税合計")}


end
