class EstimatesController < ApplicationController
    before_action :logged_in_user
    include EstimatesHelper

		def index
      get_estimates
      if params[:id].present?

      else
        @estimate = TEstimate.new(session[:user] || {})
        session[:user] = nil
      end
    end

    def new

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

    def edit

    end

    def upsert

    end

    private
    def estimate_params
      params.require(:t_estimates).permit(
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
