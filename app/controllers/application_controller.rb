class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :switch_locale

  def default_url_options
    { locale: I18n.locale, host: (ENV['STUGIS_HOST'] || 'localhost') }
  end

  private
  def switch_locale(&action)
    I18n.with_locale(extract_locale, &action)
  end
  def extract_locale
    pl = [params[:locale]]
    pl = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/[a-z]{2}/) if pl == [nil]
    al = I18n.available_locales.map(&:to_s)
    pl.each do |l|
      if al.include? l
        return l
      end
    end
    return I18n.default_locale
  end
end
