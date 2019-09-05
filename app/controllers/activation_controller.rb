class ActivationController < ApplicationController
  def create
    user_data = params[:code].split('-')
    binding.pry
    user = User.find(user_data[0])
  	if user.nil?
  		flash[:error] = "User not found!"
  		redirect_to root_path
    elsif user.registered == "true"
      flash[:notice] = "Your account is already activated!"
      redirect_to dashobard_path
  	elsif user.registered == user_data[1]
  		user.update_attributes(registered: "true")
      flash[:notice] = "Thank you! Your account is now activated."
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid activation code!"
  		redirect_to root_path
  	end
  end
end