class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resouce)
      case resouce
      when Admin
        admin_users_path
      when User
        user_homes_mypage_path
      end
    end
    def after_sign_out_path_for(resource)
      binding.pry
      if resource == :admin
        root_path
      else
        root_path
      end
    end
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :line_name, :nick_name, :email])
    end
end
