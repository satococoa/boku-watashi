class WishesController < ApplicationController
  before_filter :require_child

  # GET /wishes
  # GET /wishes.xml
  def index
    @wishes = current_user.wishes.monthly(params[:ym]).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wishes }
    end
  end

  # GET /wishes/1
  # GET /wishes/1.xml
  def show
    @wish = current_user.wishes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wish }
    end
  end

  # GET /wishes/new
  # GET /wishes/new.xml
  def new
    @wish = current_user.wishes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wish }
    end
  end

  # GET /wishes/1/edit
  def edit
    @wish = current_user.wishes.find(params[:id])
    redirect_to(@wish) if @wish.status != 0
  end

  # POST /wishes
  # POST /wishes.xml
  def create
    @wish = current_user.wishes.build(params[:wish])

    respond_to do |format|
      if @wish.save
        format.html { redirect_to(@wish, :notice => 'Wish was successfully created.') }
        format.xml  { render :xml => @wish, :status => :created, :location => @wish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wishes/1
  # PUT /wishes/1.xml
  def update
    @wish = current_user.wishes.find(params[:id])
    redirect_to(@wish) if @wish.status != 0

    respond_to do |format|
      if @wish.update_attributes(params[:wish])
        format.html { redirect_to(@wish, :notice => 'Wish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.xml
  def destroy
    @wish = current_user.wishes.find(params[:id])
    redirect_to(@wish) if @wish.status != 0
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to(wishes_url) }
      format.xml  { head :ok }
    end
  end
end
