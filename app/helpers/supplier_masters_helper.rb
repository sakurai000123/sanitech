module SupplierMastersHelper
  def get_supplier_by_id(id)
    @supplier = MSupplier.find_by(id: id)
  end

  def get_suppliers
    @suppliers = MSupplier.all.order(id: 'ASC')
  end

  # 発行者更新処理
  def input_user_set(rec)
    rec.input_user_id = @current_user.id
  end
end
