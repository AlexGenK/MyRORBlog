class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # для контроллера devise вызываем метод, который определет разрешенные 
  # к передаче из формы параметры
  before_action :configure_permitted_parameters, if: :devise_controller?

  # переопределяем метод devise, чтобы после выхода оставаться на той же странице
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  protected
  # к разрешенным параметрам для devise добавляем параметр :username
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :username
     devise_parameter_sanitizer.for(:sign_in) << :username
     devise_parameter_sanitizer.for(:account_update) << :username
  end 
end
