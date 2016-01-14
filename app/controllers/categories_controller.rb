class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
      flash[:success]= 'Category has been created'
      redirect_to :action => :index
    else
      render action: "edit"
    end

  end

 def update    
    if @category.update(category_params)
    flash[:success]= 'Category was successfully updated.'
        redirect_to :action => :index 
    else
        render action: "edit"
    end  
  end

  def destroy
    if @category.destroy
		flash[:success]= 'Category was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:error]= 'Error in Destroying Category.'
    end      
  end
  private
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
