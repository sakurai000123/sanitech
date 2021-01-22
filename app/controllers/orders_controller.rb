class OrdersController < ApplicationController
  before_action :logged_in_user
  include OrdersHelper

  def index
    get_orders
    if params[:id].present?
      get_order_by_id(params[:id])
    else
      @order = TReceiveOrder.new
    end
  end

  def edit
    get_order_by_id(params[:id])
    get_orders
    redirect_to orders_path(id: @order.id)
  end

  def upsert
    if params[:create]
      @order = TReceiveOrder.new(order_params)
      get_orders
      insert_common(@order)
      if @order.save
        redirect_to orders_path(id: @order.id)
      else
        render :index
      end
    else
      get_order_by_id(order_params[:id])
      get_orders
      update_common(@order)
      if @order.update(order_params)
        redirect_to orders_path(id: @order.id)
      else
        render :index
      end
    end
  end

  private
  def order_params
    params.require(:t_receive_order).permit(
      :id
    )  
  end
end
