class ApplicationController < ActionController::Base

  #include DeviseHelper
  layout :layout_by_resource
  protect_from_forgery with: :null_session
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
    if resource_name == :admin
      admins_dashboard_index_path      
    else if resource_name == :organization        
      organizations_dashboard_index_path
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
