module OrdersHelper
  def get_order_by_id(id)
    @order = TReceiveOrder.find_by(id: id)
  end
  
  def get_orders
    @orders = TReceiveOrder.all.order(id: 'ASC')
  end

  def aggregate_category_code_list
    return [["1:金属加工", "1"], ["2:ベルト", "2"]]
  end
end
