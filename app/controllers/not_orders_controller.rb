class NotOrdersController < ApplicationController
  def index

  end

  def create
    flash[:success] = '登録ボタン'
    redirect_to not_orders_path
  end

  def output
    flash[:success] = '発注書ボタン'
    redirect_to not_orders_path
  end

  def cancel
    flash[:success] = '発注取り消しボタン'
    redirect_to not_orders_path
  end
end
