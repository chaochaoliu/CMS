class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_paper_trail_whodunnit
  # before_filter :set_time_zone, if: :user_signed_in?



  def after_sign_in_path_for(resource)
    if current_user.un_approved?
      welcome_path
    elsif current_user.approved? 
      root_path 
    elsif current_user.admin? 
      rails_admin_path
    else
      new_user_session_path 
    end 

    # welcome_path if current_user.un_approved?

    # TODO: If not approve, redirect to some error page. 
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to new_user_session_path
  end

  
  # private

  #   def set_time_zone
  #     Time.zone = current_user.time_zone
  #   end
end
