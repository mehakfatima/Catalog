class Users::SessionsController < Devise::SessionsController
  #prepend_before_filter :allow_params_authentication, only: [:create]

  # GET /resource/sign_in
   def new
    super
   end

  # POST /resource/sign_in
   def create
    if params[:user]
      user = User.find_for_database_authentication(:email => params[:user][:email])
      if user.present?
        sign_in(user)
        if current_user.has_role? :user
          redirect_to catalog_index_path
        else
          redirect_to admins_path
        end
      end
    end
   end

  # DELETE /resource/sign_out
   def destroy    
    super
   end

   protected

   #If you have extra params to permit, append them to the sanitizer.
#   def configure_sign_in_params
#     devise_parameter_sanitizer.for(:sign_in) << :attribute
#   end
end
