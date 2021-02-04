class TReceiveOrder < ApplicationRecord
  has_many :details, class_name: 'TReceiveOrderDetail', foreign_key: 'receive_order_id', dependent: :destroy

  # 未発注一覧検索
  def self.not_order_search(params)
    conditions = []
    # conditions =+ params[:id_from].present? ? params[:id_from] : ''
    # conditions =+ params[:id_to].present? ? params[:id_to] : ''
    # conditions =+ params[:send_order_date_from].present? ? params[:send_order_date_from] : ''
    # conditions =+ params[:send_order_date_to].present? ? params[:send_order_date_to] : ''
    # conditions =+ params[:department_id].present? ? params[:department_id] : ''
    # conditions =+ params[:charge_id].present? ? params[:charge_id] : ''
    conditions.push('customer_id = ?', "#{params[:customer_id]}") if params[:customer_id].present?
    # conditions =+ params[:ship_charge_name].present? ? params[:ship_charge_name] : ''
    # conditions =+ params[:ship_post_code].present? ? params[:ship_post_code] : ''
    # conditions =+ params[:ship_prefecture].present? ? params[:ship_prefecture] : ''
    # conditions =+ params[:ship_address1].present? ? params[:ship_address1] : ''
    # conditions =+ params[:ship_address2].present? ? params[:ship_address2] : ''
    # conditions =+ params[:send_direct_flag].present? ? params[:send_direct_flag] : ''
    # conditions =+ params[:ship_phone_number].present? ? params[:ship_phone_number] : ''
    # conditions =+ params[:ship_fax_number].present? ? params[:ship_fax_number] : ''
    if conditions.nil?
      TReceiveOrder.all.includes(:details)
      
    else
      TReceiveOrder.where(
        conditions
      ).includes(:details)
    end
  end
end
