class Organizations::CategoriesController < ApplicationController
  before_action :authenticate_organization!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_organization.categories.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = current_organization.categories.new(category_params)    
    if @category.save
      flash[:notice]= 'Category has been created'
      redirect_to :action => :index
    else
      render action: "edit"
    end

  end

 def update    
    if @category.update(category_params)
    flash[:notice]= 'Category was successfully updated.'
        redirect_to :action => :index 
    else
        render action: "edit"
    end  
  end

  def destroy
    if @category.destroy
		flash[:notice]= 'Category was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:notice]= 'Error in Destroying Category.'
    end      
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :organization_id)
    end
end
