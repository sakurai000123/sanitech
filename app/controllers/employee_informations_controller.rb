class EmployeeInformationsController < ApplicationController
  before_action :logged_in_user
  include EmployeeInformationsHelper

  def index
    get_users
    if params[:id].present?
      get_user_by_id(params[:id])
    else
      @user = MUser.new(session[:user] || {})
    end
    session[:user] = nil
  end

  def edit
    get_users
    flash[:error] = nil
    flash[:success] = nil
    redirect_to employee_informations_path(id: params[:id])
  end

  def upsert
    if params[:create]
      @user = MUser.new(user_params)
      get_users
      insert_common(@user)
      if @user.save
        flash[:success] = '登録が完了しました'
        redirect_to employee_informations_path(id: @user.id)
      else
        flash[:error] = @user.errors
        session[:user] = @user.attributes.slice(*user_params.keys)
        render :index
      end
    else
      get_user_by_id(user_params[:id])
      get_users
      update_common(@user)
      if @user.update(user_params)
        flash[:success] = '更新が完了しました'
        redirect_to employee_informations_path(id: @user.id)
      else
        flash[:error] = @user.errors
        session[:user] = @user.attributes.slice(*user_params.keys)
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

