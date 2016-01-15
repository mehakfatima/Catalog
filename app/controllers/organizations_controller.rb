class OrganizationsController < ApplicationController
  before_action :authenticate_organization!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  def index
    @organizations = Organization..paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end
  
  def new
    @organization = Organization.new
  end
  
  def edit
  end
  
  def product
  end


  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:success]= 'Organization has been created'
      redirect_to :action => :index
    else
      render action: "edit"
    end

  end

  
  def update
    if @organization.update(organization_params)
        flash[:success]= 'Organization was successfully updated.'
        redirect_to :action => :index 
    else
        render action: "edit"    
    end
  end

  def destroy
    if @organization.destroy
		flash[:success]= 'Organization was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:error]= 'Error in Destroying Category.'
    end  
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name,  :email, :password, :password_confirmation)      
    end
end
