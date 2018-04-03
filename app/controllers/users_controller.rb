class UsersController < ApplicationController

  before_action :confirmed_log_in, :only => [:show, :edit]

  def index
    @users = User.order(:display_name)
    #render('index')

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(users_path)
    else
      render('new')
    end  

  end  

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to(user_path(@user))
    else
      render('edit')
    end  

  end  

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path)
  end  

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :password, :avatar)
  end  

  def confirmed_log_in
    unless session[:user_id]
    redirect_to(access_login_path)
    end     
  end

end
