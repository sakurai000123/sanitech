class ShipmentsController < ApplicationController
  before_action :logged_in_user
  include ShipmentsHelper

  def index
  end

  def create
    flash[:success] = '登録ボタン'
    render :index
  end

  def search
    flash[:success] = '検索ボタン'
    get_shipments
    render :index
  end

  def on
    flash[:success] = '全てONボタン'
    render :index
  end

  def off
    flash[:success] = '全てOFFボタン'
    render :index
  end

  def trial_send
    flash[:success] = '仮送信ボタン'
    render :index
  end

  def no_preview
    flash[:success] = 'プレビューしないで印刷ボタン'
    render :index
  end


end
