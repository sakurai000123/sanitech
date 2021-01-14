class EmployeeInformationsController < ApplicationController
  def index
    get_user
    if params[:user_code].present?
      @user = MUser.find_by(user_code: params[:user_code])
    else
      @user = MUser.new
    end
  end

  def edit
    @user = MUser.find_by(params[:user_code])
    get_user
    redirect_to employee_informations_path(user_code: @user.user_code)
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
      @user = MUser.find_by(user_code: user_params[:user_code])
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
      :user_code,
      :family_name,
      :given_name, 
      :family_name_kana,
      :given_name_kana,
      :master_key,
      :position,
      :mobile_phone_number,
      :company_car_No,
      :emergency_phone_number,
      :mail_address,
      :blood_type,
      :medical_examination_date,
      :note,
      :login_id,
      :authority_code,
      :department_code
    )
  end

  def get_user
    @users = MUser.all.order(user_code: 'ASC')
  end
end

