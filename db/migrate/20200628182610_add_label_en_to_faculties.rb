class AddLabelEnToFaculties < ActiveRecord::Migration[5.2]
  def change
    add_column :faculties, :label_en, :string
  end
end
