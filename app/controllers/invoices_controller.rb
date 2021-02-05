class InvoicesController < ApplicationController
  before_action :logged_in_user
  def index
    
  end

  def show
    flash[:success] = '選択ボタン'
    redirect_to invoices_path
  end

  def search
    flash[:success] = '検索ボタン'
    redirect_to invoices_path
  end

  def issue
    flash[:success] = '発行ボタン'
    redirect_to invoices_path
  end

  def processing
    flash[:success] = '処理ボタン'
    redirect_to invoices_path
  end
end
