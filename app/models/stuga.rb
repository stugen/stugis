class Stuga < ApplicationRecord
  self.table_name = 'stugen'
  belongs_to :faculty

  def display_name(attr)
    case attr
    when :building
      return "IW 1+2" if building == "IW"
      return "Sportturm" if building == "SpT"
      return "Grazer Str. 4" if building == "GRAZ"
      building
    else
      self.try(attr)
    end
  end
end
