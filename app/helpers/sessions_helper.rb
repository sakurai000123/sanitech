module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:id] = user.id
    session[:user_name] = user.user_name
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:id]
     #@current_user = @current_user || MUser.find_by(id: session[:id])と同じ意味
      @current_user ||= MUser.find_by(id: session[:id])
    end
  end

  #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_user?(user)
    user == current_user
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.clear()
    @current_user = nil
  end
end
