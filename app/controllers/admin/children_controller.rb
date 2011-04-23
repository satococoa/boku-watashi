class Admin::ChildrenController < Admin::ApplicationController
  before_filter :require_admin
  
  # GET /admin/children
  # GET /admin/children.xml
  def index
    @children = current_user.children.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /admin/children/1
  # GET /admin/children/1.xml
  def show
    @child = current_user.children.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @child }
    end
  end

  # GET /admin/children/new
  # GET /admin/children/new.xml
  def new
    @child = current_user.children.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @child }
    end
  end

  # GET /admin/children/1/edit
  def edit
    @child = current_user.children.find(params[:id])
  end

  # POST /admin/children
  # POST /admin/children.xml
  def create
    @child = current_user.children.build(params[:child])

    respond_to do |format|
      if @child.save
        format.html { redirect_to([:admin, @child], :notice => 'Child was successfully created.') }
        format.xml  { render :xml => @child, :status => :created, :location => @child }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/children/1
  # PUT /admin/children/1.xml
  def update
    @child = current_user.children.find(params[:id])

    respond_to do |format|
      if @child.update_attributes(params[:child])
        format.html { redirect_to([:admin, @child], :notice => 'Child was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/children/1
  # DELETE /admin/children/1.xml
  def destroy
    @child = current_user.children.find(params[:id])
    @child.destroy

    respond_to do |format|
      format.html { redirect_to(admin_children_url) }
      format.xml  { head :ok }
    end
  end
end
