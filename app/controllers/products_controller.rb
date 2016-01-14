class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  
  def index    
      @products = Product.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product =  Product.find_by_id(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find_by_id(params[:id])
  end

 
  def create
    #images = product_params.image
    @product = Product.new(product_params)  
    add_categories  
    if @product.save      
#      images.each do |image|
#        @product.update(image)
#      end
      flash[:success]= 'Product has been created'
      redirect_to :action => :index
    else
      #flash[:notice]= "Product cannot be saved. #{@product.errors.full_messages.join(' ')} "
      render action: "edit"
    end
  end

  def update    
    if @product.update(product_params)
    flash[:success]= 'Product was successfully updated.'
        redirect_to :action => :index 
    else
        render action: "edit"
    end  
  end

  def destroy
    if @product.destroy
		flash[:success]= 'Product was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:error]= 'Error in Destroying Product.'
    end      
  end
  
  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params #{ :image=> []}
      params.require(:product).permit(:name, :serial_number, :image , :category_ids)
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
