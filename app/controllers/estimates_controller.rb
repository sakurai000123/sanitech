class EstimatesController < ApplicationController
  before_action :logged_in_user
  include EstimatesHelper

  # 見積一覧
  def index
    get_estimates
  end

  # 検索
  def search
    flash[:success] = '検索ボタン'
    get_estimates
    render :index
  end

  # 新規作成
  def new
    if params[:id].present?
    else
      @estimate = TEstimate.new
      get_department
    end
  end

  # 新規作成
  def create
    @estimate = TEstimate.new(estimate_params)
    @estimate.id = rand(100)
    @estimate.issuer_id = @current_user.id
    @estimate.estimate_branch_number = 1
    @estimate.create_user_name = @current_user.user_name
    @estimate.update_user_name = @current_user.user_name
    @estimate.customer_name = "テスト"
    @estimate.estimate_amount = 0
    @estimate.tax_amount = 0
    if @estimate.save
      flash[:success] = '登録が完了しました'
      redirect_to estimates_path
    else
      flash[:error] = @estimate.errors
      session[:user] = @estimate.attributes.slice(*estimate_params.keys)
      render :new
    end
  end

  def upsert
    case params[:submit]
      when 'save' then

      when '' then

    else
      raise e
    end

    render :new
  end

  # 詳細
  def detail
    get_estimate_by_id(params[:id]) if params[:id].present?
    # @detail =  @estimate.estimate_details.new(detail_params)
  end

  # 見積選択
  def edit
    get_estimates
    flash[:error] = nil
    flash[:success] = nil
    redirect_to estimates_path(id: params[:id])
  end

  # 複製
  def copy
    # flash[:success] = '複製ボタン'
    # redirect_to estimates_path
    get_estimate_by_id(params[:id]) if params[:id].present?
  end

  # 再見積
  def reissue
    # flash[:success] = '再見積ボタン'
    # redirect_to estimates_path
    get_estimate_by_id(params[:id]) if params[:id].present?
  end

  # 受注
  def order
    flash[:success] = '受注ボタン'
    redirect_to estimates_path
  end

  # 無効
  def invalid
    flash[:success] = '無効ボタン'
    redirect_to estimates_path
  end

  # 状況区分変更
  def category
    flash[:success] = '状況区分変更ボタン'
    redirect_to estimates_path
  end

  # 見積修正
  def revise
    get_estimate_by_id(params[:id]) if params[:id].present?
  end

# --------------------------------------
# ▼見積明細
# --------------------------------------

  # 見積明細の読込
  def read
    flash[:success] = '読込ボタン'
    redirect_to new_estimate_path
  end

  # 見積明細のソート
  def sort
    flash[:success] = 'ソートボタン'
    redirect_to new_estimate_path
  end

  # PDF出力
  def output
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '見積書',
          layout: 'pdf.html',
          encording: 'UTF-8',
          template: 'estimates/output.html.erb'
      end
    end
  end

  # 登録
  def detail_create
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

  private
  def estimate_params
    params.require(:t_estimate).permit(
      :create_user_name,
      :update_user_name,
      :estimate_branch_number,
      :estimate_date,
      :department_id,
      :charge_id,
      :issuer_id,
      :authorizer_id,
      :customer_id,
      :customer_name,
      :cus_department_name,
      :cus_charge_name,
      :delivery_date_category_code,
      :payment_category_code,
      :delivery_place_code,
      :estimate_expiration_code,
      :estimate_name,
      :note,
      :estimate_amount,
      :tax_amount,
      :delete_flag
    )
  end

  def detail_params
    params.permit(
      :create_user_name,
      :update_user_name,
      :estimate_id,
      :line_number,
      :sort_number,
      :order_category_code,
      :order_category_name,
      :maker_id,
      :maker_name,
      :supplier_id,
      :product_id,
      :product_name,
      :product_model_number,
      :estimate_quantity,
      :product_unit,
      :sale_unit_price,
      :multiplication_rate,
      :detail_estimate_amount,
      :list_price,
      :original_unit_price,
      :cost_price,
      :gross_profit_margin,
      :detail_tax_amount,
      :spec_detail,
      :detail_note,
      :details_memo,
      :classification_code
    )
  end



end
