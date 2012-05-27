# encoding:utf-8
class SessionsController < ApplicationController
  layout 'login'
  def auth
    user=User.where(:name=>params[:phone],:phone=>params[:password]).first
    if !user.nil?
      session[:current_user]=user
      @user=session[:current_user]
      redirect_to :action=>"index",:controller=>"messages"
    else
      session[:current_user]=nil
      flash[:notice]="phone or password is error"
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