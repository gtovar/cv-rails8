class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale

  def after_sign_in_path_for(resource)
    dashboard_path(locale: I18n.locale)
  end
  
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


end
