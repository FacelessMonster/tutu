class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = extract_locale
  end

  private

  def extract_locale
    http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    if http_accept_language
      case http_accept_language.scan(/^[a-z]{2}/).first
      when 'en'
        'en'
      when 'ru'
        'ru'
      else
        'en'
      end
    else
      'en'
    end
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, notice: "No rights."
    end
  end
end
