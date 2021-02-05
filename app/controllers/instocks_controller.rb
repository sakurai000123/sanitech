class InstocksController < ApplicationController
  before_action :logged_in_user
  include InstocksHelper

  def index
    get_instocks
  end

  def search
    flash[:success] = '検索ボタン'
    get_instocks
    render :index
  end

  def upsert
    @instock = TPurchase.new(order_params)

    case params[:submit]
      when 'save' then
        flash[:success] = '登録ボタン'

      when 'sort' then

    else

    end

    render :index
  end

end
