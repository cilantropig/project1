#sign up is handled by devise controller, not handled by this controller.

class UsersController < ApplicationController

  # before destroying a user calls the admin_user method to check if the current user has permissions to destroy users

  before_filter :admin_user, :except => [:index, :show, :new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  # this is admind only method, user update for itself handled by devise
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # this is admin only method, user cancel account is handled by devise
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted."

    respond_to do |format|
      format.html { redirect_to admin_manage_users_path }
      format.json { head :ok }
    end
  end

  def promote
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attribute :admin, true
        format.html { redirect_to admin_manage_users_path :notice => "User successfully promoted."}
        format.json { head :ok }
      else
        format.html { redirect_to admin_manage_users_path :notice => "User not promoted."}
        format.json { head :ok }
      end
    end
  end


  private
  # called by the filter before calling destroy
  def admin_user
    redirect_to(root_path) unless user_signed_in? and current_user.admin?
  end
end
