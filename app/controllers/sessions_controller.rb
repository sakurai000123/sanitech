class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(in_charge_no: params[:session][:in_charge_no])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to menus_path
    else
      flash[:danger] = 'パスワードが違いますよー'
      redirect_to root_url
    end
  end

  def destroy
  end
end
