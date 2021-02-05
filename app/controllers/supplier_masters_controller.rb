class SupplierMastersController < ApplicationController
  before_action :logged_in_user
  include SupplierMastersHelper

  def index
    get_suppliers
    if params[:id].present?
      get_supplier_by_id(params[:id])
    else
      @supplier = MSupplier.new(session[:supplier] || {})
    end
    session[:supplier] = nil
  end

  def edit
    get_suppliers
    flash[:error] = nil
    flash[:success] = nil
    redirect_to supplier_masters_path(id: params[:id])
  end

  def upsert
    if params[:create]
      @supplier = MSupplier.new(supplier_params)
      get_suppliers
      insert_common(@supplier)
      input_user_set(@supplier)
      if @supplier.save
        flash[:success] = '登録が完了しました'
        redirect_to supplier_masters_path(id: @supplier.id)
      else
        flash[:error] = @supplier.errors
        session[:supplier] = @supplier.attributes.slice(*supplier_params.keys)
        render :index
      end
    else
      get_supplier_by_id(supplier_params[:id])
      get_suppliers
      update_common(@supplier)
      if @supplier.update(supplier_params)
        flash[:success] = '更新が完了しました'
        redirect_to supplier_masters_path(id: @supplier.id)
      else
        flash[:error] = @supplier.errors
        session[:supplier] = @supplier.attributes.slice(*supplier_params.keys)
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
      :payment_account_name,
      :payment_account_category_code,
      :payment_account_number_code,
      :payment_account_type,
      :payment_account_holder,
      :payment_bank_code,
      :payment_branch_code,
      :note
    )  
  end

end
