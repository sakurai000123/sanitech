class CustomerMastersController < ApplicationController
  before_action :logged_in_user
  include CustomerMastersHelper

  def index
    get_customers
    if params[:id].present?
      get_customer_by_id(params[:id])
    else
      @customer = MCustomer.new(session[:customer] || {})
    end
    session[:customer] = nil
  end

  def edit
    get_customers
    flash[:error] = nil
    flash[:success] = nil
    redirect_to customer_masters_path(id: params[:id])
  end

  def upsert
    if params[:create]
      @customer = MCustomer.new(customer_params)
      get_customers
      insert_common(@customer)
      if @customer.save
        flash[:success] = '登録が完了しました'
        redirect_to customer_masters_path(id: @customer.id)
      else
        flash[:error] = @customer.errors
        session[:customer] = @customer.attributes.slice(*customer_params.keys)
        render :index
      end
    else
      get_customer_by_id(customer_params[:id])
      get_customers
      update_common(@customer)
      if @customer.update(customer_params)
        flash[:success] = '更新が完了しました'
        redirect_to customer_masters_path(id: @customer.id)
      else
        flash[:error] = @customer.errors
        session[:customer] = @customer.attributes.slice(*customer_params.keys)
        render :index
      end
    end
  end

  private
  def customer_params
    params.require(:m_customer).permit(
      :id,
      :start_date,
      :department_id,
      :charge_id,
      :input_user_id,
      :customer_name,
      :charge_name,
      :charge_position,
      :cus_post_code,
      :cus_prefecture,
      :cus_address1,
      :cus_address2,
      :phone_number,
      :fax_number,
      :mail_address,
      :payment_category_code,
      :close_date_code,
      :payment_date_code,
      :deposit_account_id,
      :delete_flag
    )
  end

end
