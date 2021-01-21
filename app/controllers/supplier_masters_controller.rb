class SupplierMastersController < ApplicationController
  before_action :logged_in_user
  include SupplierMastersHelper

  def index
    get_suppliers
    @department_name = nil
    @user_name1 = nil
    @user_name2 = nil
    if params[:id].present?
      get_supplier_by_id(params[:id])
      @department_name = MDepartment.find_by(department_code: @supplier.department_id).department_name
      @charge_user_name = MUser.find_by(id: @supplier.charge_id).id
      @input_user_name = MUser.find_by(id: @supplier.input_user_id).id
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
      @supplier.create_user_name = session[:user_name]
      @supplier.update_user_name = session[:user_name]
      if @supplier.save
        redirect_to supplier_masters_path
      else
        render :index
      end
    else
      get_supplier_by_id(supplier_params[:id])
      get_suppliers
      @supplier.update_user_name = session[:user_name]
      if @supplier.update(supplier_params)
        redirect_to supplier_masters_path
      else
        render :index
      end
    end
  end

  private
  def supplier_params
    params.require(:m_supplier).permit(
      #:password,
      
    )  
  end

end
