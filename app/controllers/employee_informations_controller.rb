class EmployeeInformationsController < ApplicationController
  def index
    get_user
    if params[:employee_no].present?
      @user = User.find_by(employee_no: params[:employee_no])
    else
      @user = User.new
    end
  end

  def edit
    @user = User.find(params[:id])
    get_user
    redirect_to employee_informations_path(employee_no: @user.employee_no)
  end

  def upsert
    if params[:create]
      @user = User.new(user_params)
      get_user
      if @user.save
        redirect_to employee_informations_path
      else
        render :index
      end
    else
      @user = User.find_by(employee_no: user_params[:employee_no])
      get_user
      if @user.update(user_params)
        redirect_to employee_informations_path
      else
        render :index
      end
    end
    
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

  def get_user
    @users = User.all.order(employee_no: 'ASC')
  end
end

