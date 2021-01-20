class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
   # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to root_url
      end
    end

    # 作成共通処理
    def insert_common(rec)
      rec.create_user_name = session[:user_name]
      rec.update_user_name = session[:user_name]
    end

    # 更新共通処理
    def update_common(rec)
      rec.update_user_name = session[:user_name]
    end
    
end
