class ReceivablesController < ApplicationController
  before_action :logged_in_user
  include ReceivablesHelper

  def index
    get_receivables
    @receivable = TAccountReceivable.new
    @offset = TAccountReceivable.new
  end

  def upsert
    @receivable = TAccountReceivable.new(receivable_params)
    @offset = TAccountReceivable.new(receivable_params)

    case params[:submit]

    when 'sort' then
      flash[:success] = 'ソートボタン'
      redirect_to receivables_path

    when 'output' then
      redirect_to "/receivables/output/#{1}.pdf"

    when 'input' then
      flash[:success] = '入力ボタン'
      redirect_to receivables_path

    end

  end

  def output
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '売掛帳',
          layout: 'pdf.html',
          encording: 'UTF-8',
          template: 'receivables/output.html.erb'
      end
    end
  end

  private

  def receivable_params
    params.permit(
      :id,
      :create_user_name,
      :update_user_name,
      :billing_date,
      :customer_id,
      :applicable_date,
      :not_deposit,
      :payment_category_code,
      :deposit_plans_date,
      :amount,
      :tax_amount,
      :total_amount,
      :erase_amount,
      :deposit_date,
      :deposit_amount,
      :payment_fee,
      :offset_amount,
      :balance,
      :demand_id
    )
  end


end
