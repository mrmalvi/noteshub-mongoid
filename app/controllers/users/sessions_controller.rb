module Users
  class SessionsController < Devise::SessionsController
    def create
      puts params[:user][:login] = params[:user][:login].downcase if params[:user][:login]
      super
    end

    protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    end
  end
end
