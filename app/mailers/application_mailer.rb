class ApplicationMailer < ActionMailer::Base
  #default from: ENV['MAIL_FROM']
  layout 'mailer'
  def default_url_options
    { locale: I18n.locale, host: (ENV['STUGIS_HOST'] || 'localhost'), protocol: (ENV['STUGIS_PROTOCOL'] || 'https') }
  end
end

