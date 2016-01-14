class Admins::SessionsController < Devise::SessionsController
  #prepend_before_filter :allow_params_authentication, only: [:create]

  # GET /resource/sign_in
   def new
    super
   end

  # POST /resource/sign_in
   def create
     super
#    if params[:admin]
#      user = User.find_for_database_authentication(:email => params[:admin][:email])
#      if user.present?
#        if current_admin.present?         
#          redirect_to admins_dashboard_index_path
#        else
#          flash[:notice]="Email or password not correct"
#        end
#      end
#    end
   end

  # DELETE /resource/sign_out
   def destroy
    super
   end
   

   #protected

   #If you have extra params to permit, append them to the sanitizer.
#   def configure_sign_in_params
#     devise_parameter_sanitizer.for(:sign_in) << :attribute
#   end
end
