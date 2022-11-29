class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name email])
  end

  include Pundit::Authorization

  after_action :verify_authorized, except: %i[home], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: %i[home], unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
