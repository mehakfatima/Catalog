module ApplicationHelper
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def organizations_all
    @organizations_all ||= Organization.all
  end
  
  def products_all
    @products_all ||= Product.all
  end
  
  def categories_all
    @categories_all ||= Category.all
  end
end
