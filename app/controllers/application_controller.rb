class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # переопределяем метод devise, чтобы после выхода оставаться на той же странице
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

end
