class SessionsController < ApplicationController
  def new
    redirect_to articles_path if user_signed_in?
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  	  session[:user_id] = user.id 
  	  flash[:success] = "Welcome #{user.first_name}"
  	  redirect_to root_path
  	else
  	  flash.now[:alert] = "Invalid!!! Check Your Password/Email"
  	  render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "You have logout successfully. Cool come again!"
  	redirect_to root_path
  end

  private
end
