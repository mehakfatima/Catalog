class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #login(email, password)
  #include DeviseHelper
  layout :layout_by_resource
  protect_from_forgery with: :exception
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      login_path      
    else if resource_or_scope == :organization
      new_organization_session_path
      else
        root_path  
      end
     end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
      admins_dashboard_index_path      
    else if resource_or_scope == :organization
      new_organization_session
      else
        root_path  
      end
     end
  end
  
  
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
