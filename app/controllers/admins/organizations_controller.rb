class Admins::OrganizationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  def index
    @organizations = Organization.paginate(:page => params[:page], :per_page => 10)
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
      flash[:success]= 'Organization has been created, Email has been sent for confirmation'
      redirect_to :action => :index
    else
      render action: "edit"
    end
  end

  
  def update
    
    if @organization.update(organization_params)
      flash[:notice]= 'Organization was successfully updated.'
          redirect_to :action => :index 
      else
          render action: "edit"
    end  
  end

  def destroy
    if @organization.destroy
		flash[:notice]= 'Organization was successfully deleted.'
      	redirect_to :action => :index 
    else
      flash[:notice]= 'Error in Destroying Organization.'
    end      
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name,  :email, :password, :password_confirmation)      
    end
end
