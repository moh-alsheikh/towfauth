class HomeController < ApplicationController
  
  def welcome
  end
  
  def sign_up_otp
    if current_user && current_user.sign_up_completed?
      redirect_to sign_in_otp_path
    end
  end
  
  def sign_in_otp
    if current_user && !current_user.sign_up_completed?
      redirect_to sign_up_otp_path
    end
  end
  
end
