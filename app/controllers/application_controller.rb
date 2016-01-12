class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #login(email, password)
  layout :layout_by_resource
  protect_from_forgery with: :exception
  
  
  
  
  protected 
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "admin"
    else if devise_controller? && resource_name == :organization
        "organization"
      else
        layout_by_user 
      end
    end
  end
  
  def layout_by_user 
    if current_organization.present?
      "organization"
    else if current_admin.present?
        "admin"
      else
        "application"      
      end
    end
  end
end
