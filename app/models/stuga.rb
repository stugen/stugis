class Stuga < ApplicationRecord
  self.table_name = 'stugen'
  belongs_to :faculty
end
