module SupplierMastersHelper
  def get_supplier_by_id(id)
    @supplier = MSupplier.find_by(id: id)
  end

  def get_suppliers
    @suppliers = MSupplier.all.order(id: 'ASC')
  end
end
