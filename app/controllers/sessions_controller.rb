class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password]) # get this for free from has_secure_password
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Logged in" 
  		#redirect_to Welcome#index, notice: "Logged in"
  	else 
  		flash.now.alert = "Email or password invalid"
  		#render "new" #I want to try and do this from the nav, so I want to do it without rendering a new page
  	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to root_url, notice: "Logged out"
  end

end
