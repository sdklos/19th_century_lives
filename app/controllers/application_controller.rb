class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
