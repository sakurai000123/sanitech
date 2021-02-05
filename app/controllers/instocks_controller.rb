class InstocksController < ApplicationController
  before_action :logged_in_user
  include InstocksHelper

  def index
    get_instocks
  end

  def create
    flash[:success] = '登録ボタン'
    render :index
  end

  def search
    flash[:success] = '検索ボタン'
    get_instocks
    render :index
  end

  def on
    flash[:success] = 'ONボタン'
    render :index
  end

  def off
    flash[:success] = 'OFFボタン'
    render :index
  end

end
