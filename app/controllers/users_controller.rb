class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index

    if params[:phone]
        @users = User.find_by_phone params[:phone]
    elsif params[:email]
        @users = User.find_by_email params[:email]
    else
        @users = User.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users.xml
  def create
    if params[:user]
      @user = User.new(params[:user])
    else
      @user = User.new(
        :name => params[:name],
        :email => params[:email], 
        :password => params[:password],
        :phone => params[:phone]
      )
    end

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.xml  { render :xml => @user }
      else
        format.html
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
