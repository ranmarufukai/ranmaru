class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      stored_location_for(resource) ||
        if resource.is_a?(Admin)
          admin_dashboard_path
        else
          user_path(resource)
        end
    end

  def after_sign_out_path_for(resource)
      root_path
  end

  include ApplicationHelper

  private
  # 以下の1行は消さないでください
 
 


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end 
end