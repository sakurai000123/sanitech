module ShipmentsHelper

  def get_shipments
    @shipments = TSale.all.order(id: 'ASC')
  end

end
