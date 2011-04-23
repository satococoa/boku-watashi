class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery

  private
  def current_user
    @current_user ||= Child.find(session[:child_id]) if session[:child_id]
  end

  def require_child
    redirect_to child_login_url unless current_user.try(:child?)
  end

  def require_admin
    redirect_to admin_login_url unless current_user.try(:admin?)
  end
end
