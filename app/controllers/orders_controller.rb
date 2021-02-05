class OrdersController < ApplicationController
  before_action :logged_in_user
  include OrdersHelper

  # @order
  # @detail
  # @details

  def index
    get_orders
  end

  def new
    # debug
    @param = {}

    @order = params[:id].blank? ? TReceiveOrder.new : get_order_by_id(params[:id])
    @detail = TReceiveOrderDetail.new
    @details = @order.id.blank? ? [] : get_details(@order.id)
  end

  # def edit
  #   get_order_by_id(params[:id])
  #   get_orders
  #   redirect_to orders_path(id: @order.id)
  # end

  def upsert
    # debug
    @param = params.dup

    @order = TReceiveOrder.new(order_params)
    @detail = TReceiveOrderDetail.new(detail_params)
    # @detail = TReceiveOrderDetail.new
    @details = get_details('1')

    case params[:submit]
    when 'save' then
      # @order.save

    when 'read' then

    when 'sort' then

    when 'detail_select' then
      # @detail = @details[params[:select_detail]]
      # @detail = get_detail_by_id(params[:select_detail])

    when 'detail_lineup' then
      @detail.sort_number -= 1
      @detail.save

      @details.each do |d|
        if d.sort_number == @detail.sort_number
          d.sort_number += 1
          d.save
          break
        end
      end

    when 'detail_linedown' then
      @detail.sort_number += 1
      @detail.save

      @details.each do |d|
        if d.sort_number == @detail.sort_number
          d.sort_number -= 1
          d.save
          break
        end
      end

    when 'detail_addfront' then

    when 'detail_addback' then

    when 'detail_delete' then
      update_list = []
      sort_num = @detail.sort_number
      @detail.destroy

      @details.each do |d|
        if d.sort_number > sort_num
          d.sort_number -= 1
          update_list.add(d)
        end
      end

      if update_list.present?
        update update_list
      end

    when 'detail_copy' then
      # @detail.id = ''
      # @detail.save

    when 'detail_save' then
      # @detail.save

    else
      raise e
    end

    render :new
  end

  def read
  end

  def pdf
  end

  private

  def order_params
    params.require(:t_receive_order).permit(
      :id,
      :receive_order_date,
      :estimate_id,
      :department_id,
      :charge_id,
      :assistant_id,
      :customer_id,
      :cus_department_name,
      :cus_charge_name,
      :bill_id,
      :bill_name,
      :ship_id,
      :ship_charge_name,
      :ship_post_code,
      :ship_prefecture,
      :ship_address1,
      :ship_address2,
      :receive_order_name,
      :ship_phone_number,
      :ship_fax_number,
      :cus_order_number,
      :aggregate_category_code,
      :receive_order_amount,
      :tax_amount
    )
  end

  def detail_params
    params[:t_receive_order].require(:t_receive_order_details).permit(
      :id,
      :spec_detail,
      :detail_note,
      :detail_memo
    )
  end
end
