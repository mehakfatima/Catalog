class Organizations::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
    if params[:organization]
      org = Organization.find_for_database_authentication(:email => params[:organization][:email])      
       if org.present?
         sign_in(org)
        redirect_to products_path
      end
    end
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
