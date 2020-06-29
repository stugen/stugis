class StugenMailer < ApplicationMailer
  def notification
    @stuga = params[:stuga]
    mail(to: '', cc: 'schuerholz@uni-bremen.de', subject: "#{t('mail.subjects.notification', locale: :de)} / #{t('mail.subjects.notification', locale: :en)}")
  end

  def confirmation
    @stuga = params[:stuga]
    @changed = params[:changed]
    mail(to: '', cc: 'schuerholz@uni-bremen.de', subject: "#{t('mail.subjects.confirmation', locale: :de)} / #{t('mail.subjects.confirmation', locale: :en)}")
  end
end
