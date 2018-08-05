class CreateStugen < ActiveRecord::Migration[5.1]
  def change
    create_table :stugen do |t|
      t.string :label
      t.string :abbreviation, default: ''
      t.string :description, default: ''
      t.references :faculty, foreign_key: true
      t.string :picture, default: ''
      t.string :website, default: ''
      t.string :email, default: ''
      t.string :telephone, default: ''
      t.string :building, default: ''
      t.string :room, default: ''

      t.timestamps
    end
  end
end
