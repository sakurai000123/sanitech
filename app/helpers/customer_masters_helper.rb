module CustomerMastersHelper
  def get_customer_by_id(id)
    @customer = MCustomer.find_by(id: id)
  end

  def get_customers
    @customers = MCustomer.all.order(id: 'ASC')
  end

  # 発行者更新処理
  def input_user_set(rec)
    rec.input_user_id = @current_user.id
  end

end
