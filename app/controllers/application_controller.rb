class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     protect_from_forgery with: :exception
     rescue_from CanCan::AccessDenied, with: :access_denied


     # rescue_from CanCan::AccessDenied do |exception|
     #      respond_to do |format|
               
     #           format.json { head :forbidden, content_type: 'text/html' }
     #           format.html { redirect_to user_signed_in? ? root_path : new_user_session_path, alert: exception.message }
     #           format.js   { head :forbidden, content_type: 'text/html' }
     #      end
     # end
     

     protected

     def access_denied(exception)
          store_location_for :user, request.path
          redirect_to user_signed_in? ? root_path : new_user_session_path, alert: exception.message
     end

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
          devise_parameter_sanitizer.permit(:account_update, keys: [:name])
     end
end
