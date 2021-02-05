module InstocksHelper

  def get_instocks
    @instocks = TPurchase.all.order(id: 'ASC')
  end

end
