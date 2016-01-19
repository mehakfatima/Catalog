class Catalog::ProductsController < ApplicationController
  def index
    if params[:product].present?
      query = params[:product][:category_id] +  params[:product][:name] +  params[:product][:organization_id]
      if(query.present?)
        @search = Product.custom_search(query)
      else
        @search = Product.all
      end      
      @products = @search.paginate(:page => params[:page], :per_page => 12)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 12) 
    end
	end
  
  def show
    @product =  Product.find_by_id(params[:id])
  end
end
