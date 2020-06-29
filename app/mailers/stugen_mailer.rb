class StugenMailer < ApplicationMailer
  def notification
    @stuga = params[:stuga]
    mail(to: "#{@stuga.label} <#{@stuga.email}>", cc: 'schuerholz+stugis_notification@uni-bremen.de', subject: "#{t('mail.subjects.notification', locale: :de)} / #{t('mail.subjects.notification', locale: :en)}")
  end

  def confirmation
    @stuga = params[:stuga]
    @changed = params[:changed]
    mail(to: '', cc: 'schuerholz+stugis_confirmation@uni-bremen.de', subject: "#{t('mail.subjects.confirmation', locale: :de)} / #{t('mail.subjects.confirmation', locale: :en)}")
  end
end
