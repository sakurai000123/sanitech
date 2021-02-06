class PayablesController < ApplicationController
  before_action :logged_in_user
  include PayablesHelper

  def index
    get_payables
    @payable = TAccountPayable.new
    @offset = TAccountPayable.new
  end

  def upsert
    @payable = TAccountPayable.new(payable_params)
    @offset = TAccountPayable.new(payable_params)

    case params[:submit]

    when 'sort' then
      flash[:success] = 'ソートボタン'
      redirect_to payables_path

    when 'output' then
      redirect_to "/payables/output/#{1}.pdf"

    when 'input' then
      flash[:success] = '入力ボタン'
      redirect_to payables_path

    end

  end

  def output
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '売掛帳',
          layout: 'pdf.html',
          encording: 'UTF-8',
          template: 'payables/output.html.erb'
      end
    end
  end

  private

  def payable_params
    params.permit(
      :id,
      :create_user_name,
      :update_user_name,
      :billing_date,
      :supplier_id,
      :applicable_date,
      :not_payment,
      :payment_plans_date,
      :payment_category_code,
      :amount,
      :tax_amount,
      :total_amount,
      :erase_amount,
      :payment_date,
      :payment_amount,
      :payment_fee,
      :offset_amount,
      :balance,
      :demand_no
    )
  end

end
