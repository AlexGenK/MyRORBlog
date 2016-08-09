class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # для контроллера devise вызываем метод, который определет разрешенные 
  # к передаче из формы параметры
  before_action :configure_permitted_parameters, if: :devise_controller?

  # переопределяем метод devise, чтобы после выхода оставаться на той же странице
  def after_sign_out_path_for(resource_or_scope)
    request.referrer || root_path
  end

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  # переопределяем метод devise, чтобы после входа оставаться на той же странице
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  protected
  # к разрешенным параметрам для devise добавляем параметр :username
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
     devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end 
end
