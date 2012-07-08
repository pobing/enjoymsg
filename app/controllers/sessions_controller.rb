# encoding:utf-8
class SessionsController < ApplicationController
  layout 'login'
  def auth

  end

  def create
    user=User.authenticate(params[:phone], params[:password])
    if !user.nil?
      session[:user_id] = user.id
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

  def destroy
    session[:user_id]=nil
    redirect_to messages_url,:notice=>'Logged out'
  end
end