class InquiryChargesController < ApplicationController
  before_action :logged_in_user
  def index
    
  end

  def search
    flash[:success] = '検索ボタン'
    redirect_to inquiry_charges_path
  end

  def clear
    flash[:success] = 'クリアボタン'
    redirect_to inquiry_charges_path
  end

  def preview
    flash[:success] = 'プレビューボタン'
    redirect_to inquiry_charges_path
  end
end
