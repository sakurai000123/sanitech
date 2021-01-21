class SupplierMastersController < ApplicationController
  before_action :logged_in_user
  include SupplierMastersHelper

  def index
    get_suppliers
    if params[:id].present?
      get_supplier_by_id(params[:id])
    else
      @supplier = MSupplier.new
    end
  end

  def edit
    get_supplier_by_id(params[:id])
    get_suppliers
    redirect_to supplier_masters_path(id: @supplier.id)
  end

  def upsert
    if params[:create]
      @supplier = MSupplier.new(supplier_params)
      get_suppliers
      insert_common(@supplier)
      if @supplier.save
        redirect_to supplier_masters_path(id: @supplier.id)
      else
        render :index
      end
    else
      get_supplier_by_id(supplier_params[:id])
      get_suppliers
      update_common(@supplier)
      if @supplier.update(supplier_params)
        redirect_to supplier_masters_path(id: @supplier.id)
      else
        render :index
      end
    end
  end

  private
  def supplier_params
    params.require(:m_supplier).permit(
      :id,
      :supplier_number,
      :start_date,
      :department_id,
      :charge_id,
      :input_user_id,
      :supplier_name,
      :charge_name,
      :charge_position,
      :post_code,
      :prefecture,
      :address1,
      :address2,
      :phone_number,
      :fax_number,
      :mail_address,
      :payment_category_code,
      :close_date_code,
      :payment_day_code,
      :payment_account_id,
      :note
    )  
  end

end
