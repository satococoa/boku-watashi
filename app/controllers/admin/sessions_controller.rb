# coding: utf-8
class Admin::SessionsController < Admin::ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to admin_root_url, :notice => 'ログインしました'
    else
      flash.now.alert = 'メールアドレスかパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'ログアウトしました'
  end
end
