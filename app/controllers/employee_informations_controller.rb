class EmployeeInformationsController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    if params[:create]
      @user = User.new(user_params)
      @user.save!
    else
      logger.debug("employee_no")
      logger.debug(user_params[:employee_no])
      @user = User.find_by(employee_no: user_params[:employee_no])
      @user.update(user_params)
    end
    @users = User.all
    redirect_to employee_informations_path
  end
  
  private
  def user_params
    params.require(:user).permit(
      :password,
      :joined_company_date,
      :employee_no,
      :name,
      :name_ruby, 
      :master_key,
      :company_phone,
      :company_car_no,
      :emergency_contact_phone,
      :emergency_contact_name,
      :email,
      :blood_type,
      :health_check_date,
      :remarks
    )
  end
end

