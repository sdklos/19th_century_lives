class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotUnique do |exception|
    message = "An account with that email already exists."
    redirect_to root_url, :alert => message
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

end
