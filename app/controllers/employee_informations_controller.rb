class EmployeeInformationsController < ApplicationController
  before_action :logged_in_user
  def index
    get_user
    @department_name = nil
    if params[:id].present?
      @user = MUser.find_by(id: params[:id])
      @department_name = MDepartment.find_by(id: @user.department_id).department_name
    else
      @user = MUser.new
    end
  end

  def edit
    @user = MUser.find_by(id: params[:id])
    get_user
    redirect_to employee_informations_path(id: @user.id)
  end

  def upsert
    if params[:create]
      @user = MUser.new(user_params)
      get_user
      @user.create_user_name = session[:user_name]
      @user.update_user_name = session[:user_name]
      if @user.save
        redirect_to employee_informations_path
      else
        render :index
      end
    else
      @user = MUser.find_by(id: user_params[:id])
      get_user
      @user.update_user_name = session[:user_name]
      if @user.update(user_params)
        redirect_to employee_informations_path
      else
        render :index
      end
    end
    
  end
  

  private
  def user_params
    params.require(:m_user).permit(
      :password,
      :hire_date,
      :id,
      :user_name,
      :user_name_kana,
      :master_key,
      :position,
      :mobile_phone_number,
      :company_car_no,
      :emergency_phone_number,
      :emergency_name,
      :mail_address,
      :blood_type,
      :medical_examination_date,
      :note,
      :login_id,
      :authority_code,
      :department_id,
      :affiliation_department,
      :authority_id
    )
  end

  def get_user
    @users = MUser.all.order(id: 'ASC')
  end
end

