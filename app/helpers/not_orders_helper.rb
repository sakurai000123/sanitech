module NotOrdersHelper
  def get_orders
    @orders = TReceiveOrder.all.order(id: 'ASC')
  end
end
