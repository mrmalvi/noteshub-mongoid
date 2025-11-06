module Users
  class SessionsController < Devise::SessionsController
    def create
      puts params[:user][:login] = params[:user][:login].downcase if params[:user][:login]
      super
    end
  end
end
