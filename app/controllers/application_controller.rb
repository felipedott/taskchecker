class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except: %i[home], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: %i[home], unless: :skip_pundit?

  protect_from_forgery

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name email])
  end

  def after_sign_in_path_for(_user)
    params[:target] || dashboard_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
