# encoding:utf-8
class SessionsController < ApplicationController
  layout 'login'
  def auth

  end

  def create
     Rails.logger.debug "debug sssssssssssssss #{params}"
    user=User.authenticate(params[:phone], params[:password])
   
    if !user.nil?
        session[:user_id] = user.id
      # redirect_to admin_url
      redirect_to :action=>"index",:controller=>"messages"
    else
     redirect_to login_url, :alert => "Invalid user/password"
    end
  end

  def register
    @user = User.new(params[:user])
    if @user.save
      flash[:notice]="User #{@user.phone} was successfully created."
    else
    # redirect_to :action=>"register",:controller=>"sessions"
    end

  end
end