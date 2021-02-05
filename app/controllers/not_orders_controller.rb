class NotOrdersController < ApplicationController
  before_action :logged_in_user
  include NotOrdersHelper

  def index
    #@orders = params[:orders] if params[:orders].present?
  end

  def search
    flash[:success] = '検索ボタン'
    @orders = TReceiveOrder.not_order_search(params)
    #redirect_to not_orders_path(orders: @orders)
    render :index
  end

  def create
    flash[:success] = '登録ボタン'
    redirect_to not_orders_path
  end

  def output
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '発注書',
          layout: 'pdf.html',
          encording: 'UTF-8',
          template: 'not_orders/output.html.erb'
      end
    end
  end

  def cancel
    flash[:success] = '発注取り消しボタン'
    redirect_to not_orders_path
  end
end
