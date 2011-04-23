# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    child = Child.authenticate(params[:childname], params[:password])
    if child
      session[:child_id] = child.id
      redirect_to child_root_url, :notice => 'ログインしました'
    else
      flash.now.alert = 'ユーザー名かパスワードが間違っています'
      render 'new'
    end
  end
        
  def destroy
    session[:child_id] = nil
    redirect_to root_url, :notice => 'ログアウトしました'
  end
end
