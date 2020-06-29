class ApplicationMailer < ActionMailer::Base
  #default from: ENV['MAIL_FROM']
  layout 'mailer'
  def default_url_options
    { locale: I18n.locale, host: (ENV['STUGIS_HOST'] || 'localhost') }
  end
end

