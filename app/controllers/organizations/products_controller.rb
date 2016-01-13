class Organizations::ProductsController < ApplicationController
  #before_action :authenticate_user! || :authenticate_organization!
  before_action :set_product, only: [:show, :edit, :update, :destroy]  
  before_filter :org_id ,only: [:new, :edit] 
  
  def index
    if current_organization
      organization = Organization.find_by_email(current_organization.email)
      @products = organization.products
    end    
  end
  
  def show
    @product =  Product.find_by_id(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def create
    @product = Product.new(product_params)  
    add_categories  
    if @product.save
      flash[:notice]= 'Product has been created'
      redirect_to :action => :index
    else
      flash[:notice]= "Product cannot be saved. #{@product.errors.full_messages.join(' ')} "
      render action: "edit"
    end
  end

  def update    
    if @product.update(product_params)
    flash[:notice]= 'Product was successfully updated.'
        redirect_to :action => :index 
    else
        render action: "edit"
    end  
  end

  def destroy
    if @product.destroy
		flash[:notice]= 'Product was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:notice]= 'Error in Destroying Product.'
    end      
  end

  private
    
  def set_product
    @product = Product.find(params[:id])
  end

  def org_id
    if current_organization
      @org_id = current_organization.id
    else
      @org_id = params[:organization_id]
    end
  end  
  
  def product_params
    params.require(:product).permit(:name, :serial_number,:image, :organization_id , :category_ids)
  end

  def add_categories
    @product = Product.new(product_params)
    if params[:category_ids].present?
      params[:category_ids].each do |id|
        category = Category.find(id)
        @product.categories << category
      end
    else
      render :new , notice: 'Category cannot be null'
    end
  end
    
end
