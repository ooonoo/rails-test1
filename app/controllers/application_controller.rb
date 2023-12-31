class ApplicationController < ActionController::Base
    before_action:set_current_user

   def set_current_user
    @current_user = User.find_by(id: session[:user_id])
   end

   def authenticate_user
    if @current_user == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/login")
    end
   end
   # ログインしていない状態で直接ログイン時に表示される項目へ入れないようにするためのアクション

   def forbid_login_user
    if @current_user
        flash[:notice] = "すでにログインしています"
        redirect_to("/posts/undex")
    end
   end
   # ログイン時に直接ログインしていない状態に表示される項目へ入れないようにするためのアクション
end
