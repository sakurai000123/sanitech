class CustomerMastersController < ApplicationController
  before_action :logged_in_user
  include CustomerMastersHelper

  def index
    get_customers
    if params[:id].present?
      get_customer_by_id(params[:id])
    else
      @customer = MCustomer.new
    end

  end

  def edit
    get_customer_by_id(params[:id])
    get_customers
    redirect_to customer_masters_path(id: @customer.id)
  end

  def upsert
    if params[:create]
      @customer = MCustomer.new(customer_params)
      get_customers
      insert_common(@customer)
      if @customer.save
        redirect_to customer_masters_path(id: @customer.id)
      else
        render :index
      end
    else
      get_customer_by_id(customer_params[:id])
      get_customers
      update_common(@customer)
      if @customer.update(customer_params)
        redirect_to customer_masters_path(id: @customer.id)
      else
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
