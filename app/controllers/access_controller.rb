class AccessController < ApplicationController

  
  before_action :confirmed_log_in, :only => [:menu]

  def menu
  end

  def login

  end

  def attempt_login
    puts "attempting login!"
    if params[:display_name].present? && params[:password].present?
      puts "both feilds are present!"
      found_user = User.where(:display_name => params[:display_name]).first
      if found_user #if not nil
        puts "user was found!"
        auth_user = found_user.authenticate(params[:password])
      end
    end
 
    if auth_user
      puts "setting user session!"
      session[:user_id] = auth_user.id
      redirect_to(posts_path)
    else
      puts "user validation failed"
      render('login')
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(access_login_path)
  end

  private

  def confirmed_log_in
    unless session[:user_id]
    redirect_to(access_login_path)
    end     
  end
end
