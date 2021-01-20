module CustomerMastersHelper
  def get_customer_by_id(id)
    @customer = MCustomer.find_by(id: id)
  end

  def get_customers
    @customers = MCustomer.all.order(id: 'ASC')
  end
end
