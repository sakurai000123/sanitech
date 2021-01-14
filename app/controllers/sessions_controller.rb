class SessionsController < ApplicationController
  def new
  end

  def create
    user = MUser.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to menus_path
    else
      flash[:danger] = 'パスワードが違いますよー'
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
