class Admin::WishesController < Admin::ApplicationController
  before_filter :require_admin

  def index
    @child = current_user.children.find(params[:child_id])
    @wishes = @child.wishes.monthly(params[:ym]).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wishes }
    end
  end

  def approve
    @child = current_user.children.find(params[:child_id])
    @wish = @child.wishes.find(params[:id])
    @wish.status = 1

    respond_to do |format|
      if @wish.save
        format.html { redirect_to(admin_child_wishes_path(@child), :notice => 'Wish was successfully approved.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  def reject
    @child = current_user.children.find(params[:child_id])
    @wish = @child.wishes.find(params[:id])
    @wish.status = 2

    respond_to do |format|
      if @wish.save
        format.html { redirect_to(admin_child_wishes_path(@child), :notice => 'Wish was successfully rejected.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

end
