class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  unless Rails.env.production?
    rescue_from Exception,                      with: :_render_404
    rescue_from ActiveRecord::RecordNotFound,   with: :_render_404
    rescue_from ActionController::RoutingError, with: :_render_404
  end
  
  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  def after_sign_in_path_for(resouce)
    case resouce
    when Admin
      admin_top_path
    when User
      user_homes_mypage_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nick_name, :email])
    end

    # エラーページ作成
    def _render_404(e = nil)
      render 'errors/404'
    end
end
