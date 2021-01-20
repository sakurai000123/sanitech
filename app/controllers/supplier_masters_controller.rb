class SupplierMastersController < ApplicationController
  before_action :logged_in_user
  def index
    get_suppliers
    @department_name = nil
    @user_name1 = nil
    @user_name2 = nil
    if params[:supplier_code].present?
      @supplier = MSupplier.find_by(supplier_code: params[:supplier_code])
      @department_name = MDepartment.find_by(department_code: @supplier.department_id).department_name
      @charge_user_name = MUser.find_by(id: @supplier.charge_id).id
      @input_user_name = MUser.find_by(id: @supplier.input_user_id).id
    else
      @supplier = MSupplier.new
    end
  end

  def edit
    @supplier = MSupplier.find_by(params[:supplier_code])
    get_suppliers
    redirect_to supplier_masters_path(supplier_code: @supplier.supplier_code)
  end

  def upsert
    if params[:create]
      @supplier = MSupplier.new(supplier_params)
      get_suppliers
      @supplier.create_user_name = session[:user_name]
      @supplier.update_user_name = session[:user_name]
      if @supplier.save
        redirect_to supplier_masters_path
      else
        render :index
      end
    else
      @supplier = MSupplier.find_by(supplier_code: supplier_params[:supplier_code])
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

  def get_suppliers
    @suppliers = MSupplier.all.order(supplier_code: 'ASC')
  end
end
