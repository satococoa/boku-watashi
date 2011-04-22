# coding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_root_url, :notice => '登録しました'
    else
      render 'new'
    end
  end
end
