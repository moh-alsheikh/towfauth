class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :ensure_signup_complete
  
  def after_sign_up_path_for(resource)
    #send current token key
    complete_sign_up_path
  end
 
 
  def after_sign_in_path_for(resource)
    #send current token key
    complete_sign_in_path
  end
  
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :country_code, :mobile_no,:sign_up_completed) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me,:sign_up_completed) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :country_code, :mobile_no,:sign_up_completed) }
  end
  
  def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      return if action_name == 'complete_registration'
      if current_user && !current_user.sign_up_completed?
        redirect_to complete_registration_path
      end
   end
   
   rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
   def render_record_not_found(exception="")
     respond_to do |format|
       format.html {  redirect_to :root , :flash => {alert:  t(:error_message_details) + I18n.t(:record_not_found) }} 
       format.all { render nothing: true, status: 404 }
     end
   end
   
   
  
end


__END__
  
  
  
  ===================================================================================================
    
   rescue_from CanCan::AccessDenied do |exception|    
     if current_user
       redirect_to :root , :flash => {alert:   I18n.t(:cancan_not_authorized)} 
     else
       redirect_to new_user_session_path , :flash => {alert:  I18n.t(:login_requierd_message)} 
     end
   end
   
   
   
   ===================================================================================================
   
   
   def after_sign_up_path_for(resource)
     complete_sign_up_path
   end
  
  
   def after_sign_in_path_for(resource)
     complete_sign_in_path
   end
   
   
   ===================================================================================================