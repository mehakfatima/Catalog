class ProductsController < ApplicationController  
  before_action :authenticate_admin!, except:[:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  
  def index    
      @products = Product.paginate(:page => params[:page], :per_page => 10)

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
    if params[:category_ids].present?    
      if @product.save
       add_categories(@product)
       add_images(@product)
        flash[:success]= 'Product has been created'
        redirect_to :action => :index    
      else
        render action: "edit"
       end
    else
      flash[:error]= 'Category cannot be null'
      render action: "edit"
    end       
  end

  def update 
    
    if @product.update(product_params)      
      @product.categories.delete_all
      add_images(@product)
      add_categories(@product)
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
    
    def product_params        
      params.require(:product).permit(:name, :serial_number, { :images=> []} , :category_ids, :season_id)
    end
    
    def add_images(product)
       if params[:images]
        params[:images].each { |image|
          product.galleries.create(image: image)
        }
      end
    end
    
  def add_categories(product)  
    if params[:category_ids].present?    
      params[:category_ids].each do |id|
      category = Category.find(id)
      product.categories << category
      end
    end
  end
  
  def add_season
    @product.season = params[:season_id]
  end
    
end
