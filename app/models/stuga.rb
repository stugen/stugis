class Stuga < ApplicationRecord
  self.table_name = 'stugen'
  belongs_to :faculty

  after_save :send_confirmation_email

  def display_name(attr)
    case attr
    when :building
      return "IW 1+2" if building == "IW"
      return "Sportturm" if building == "SpT"
      return "Grazer Str. 4" if building == "GRAZ"
      return "ZeMKI (Linzer Straße 4)" if building == "ZeMKI"
      building
    else
      self.try(attr)
    end
  end

  private

  def send_confirmation_email
    attrs = previous_changes.except('updated_at', 'created_at', 'confirmed', 'label', 'label_en', 'abbreviation', 'abbreviation_en', 'faculty_id', 'email', 'id', 'verification_token')
    unless attrs.empty?
      StugenMailer.with(stuga: self, changed: attrs).confirmation.deliver_later
    end
  end
end
