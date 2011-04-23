class Admin::WishesController < Admin::ApplicationController
  before_filter :require_admin

  def index
  end

  def approve
  end

  def reject
  end

end
