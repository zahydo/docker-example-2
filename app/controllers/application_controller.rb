class ApplicationController < ActionController::Base

  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  after_filter :store_location
  def store_location
    session[:previous_urls] ||= []
    # store unique urls only
    session[:previous_urls].prepend request.fullpath if session[:previous_urls].first != request.fullpath
    # For Rails < 3.2
    # session[:previous_urls].unshift request.fullpath if session[:previous_urls].first != request.fullpath 
    session[:previous_urls].pop if session[:previous_urls].count > 2
  end

  def after_sign_in_path_for(resource)
    if resource.email == "admin@alcompas.com"
      users_path
    else
      if session[:previous_urls].last == "/users/sign_up"
        songs_path
      #El === permite comparar una EXP con un STRING 
      #elsif /^\A.songs.\d*\z$/ === session[:previous_urls].last
      #  session[:previous_urls].last
      # =end
      else
        session[:previous_urls].last || root_path
      end
    end
  end

  private
  def user_not_authorized
    flash[:notice] = "No tiene permisos para realizar esta operación"
    redirect_to(request.referrer || root_path)
  end

  protected
  def configure_permitted_parameters
   	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:nombres,:apellidos,:apodo,:password,:password_confirmation,:imagenPerfil)}
  end
end
