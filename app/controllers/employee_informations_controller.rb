class EmployeeInformationsController < ApplicationController
  before_action :logged_in_user
  include EmployeeInformationsHelper

  def index
    get_users
    @department_name = nil
    @authority_name = nil
    if params[:id].present?
      get_user_by_id(params[:id])
      @department_name = MDepartment.find_by(id: @user.department_id).department_name
      @authority_name = MAuthority.find_by(id: @user.authority_id).authority_name
    else
      @user = MUser.new
    end
  end

  def edit
    get_user_by_id(params[:id])
    get_users
    redirect_to employee_informations_path(id: @user.id)
  end

  def upsert
    if params[:create]
      @user = MUser.new(user_params)
      get_users
      insert_common(@user)
      if @user.save
        redirect_to employee_informations_path
      else
        render :index
      end
    else
      get_user_by_id(user_params[:id])
      get_users
      update_common(@user)
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

end

