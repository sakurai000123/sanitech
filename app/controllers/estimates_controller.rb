class EstimatesController < ApplicationController
    before_action :logged_in_user
    include EstimatesHelper

		def index
      get_estimates
    end

    def new
      if params[:id].present?

      else
        @estimate = TEstimate.new
        get_department
      end
    end

    def create
      @estimate = TEstimate.new(estimate_params)
      @estimate.id = 18
      @estimate.issuer_id = @current_user.id
      @estimate.estimate_branch_number = 1
      @estimate.create_user_name = @current_user.user_name
      @estimate.update_user_name = @current_user.user_name
      @estimate.customer_name = MCustomer.find(@estimate.customer_id).customer_name
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

    def edit
    end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: '見積書',
            layout: 'pdf.html',
            encording: 'UTF-8',
            template: 'estimates/show.html.erb'
        end
      end
    end

    def upsert
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




end
