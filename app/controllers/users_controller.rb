class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def destroy
    sign_out 
    redirect root_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updted"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
end
