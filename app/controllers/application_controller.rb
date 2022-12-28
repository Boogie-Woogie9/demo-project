# frozen_string_literal: true

# apllication controller
class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    return unless I18n.available_locales.map(&:to_s).include?(parsed_locale)

    parsed_locale.to_sym
  end

  def put_score(param)
    @put_score = param
  end

  helper_method :current_user, :current_user_id
end
