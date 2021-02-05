class EstimateDetailsController < ApplicationController
  before_action :logged_in_user
  include EstimatesHelper

  # 登録
  def create
    flash[:success] = '登録ボタン'
    redirect_to new_estimate_path
  end

  # ↑
  def up
    flash[:success] = 'upボタン'
    redirect_to new_estimate_path
  end

  # ↓
  def down
    flash[:success] = 'downボタン'
    redirect_to new_estimate_path
  end

  # 前行追加
  def front_line
    flash[:success] = '前行追加ボタン'
    redirect_to new_estimate_path
  end

  # 後行追加
  def back_line
    flash[:success] = '後行追加ボタン'
    redirect_to new_estimate_path
  end

  # 行削除
  def delete_row
    flash[:success] = '行削除ボタン'
    redirect_to new_estimate_path
  end

  # 行複写
  def copy_row
    flash[:success] = '行複写ボタン'
    redirect_to new_estimate_path
  end


end
