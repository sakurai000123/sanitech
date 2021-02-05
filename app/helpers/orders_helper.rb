module OrdersHelper
  def get_order_by_id(id)
    return TReceiveOrder.find_by(id: id)
  end

  def get_orders
    return TReceiveOrder.all.order(id: 'ASC')
  end

  def get_details(order_id)
    # return TReceiveOrderDetail.where(receive_order_id: order_id).order(id: 'ASC')
    return TReceiveOrderDetail.all.order(sort_number: 'ASC')
  end

  def get_detail_by_id(id)
    return TReceiveOrderDetail.find_by(id: id)
  end

  def aggregate_category_code_list
    return [["1:金属加工", "1"], ["2:ベルト", "2"]]
  end
end
