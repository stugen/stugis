class CreateStugen < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :stugen, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :label, null: false
      t.string :abbreviation, default: ''
      t.string :information, default: ''
      t.references :faculty, foreign_key: true
      t.string :website, default: ''
      t.string :email, default: ''
      t.string :telephone, default: ''
      t.string :building, default: ''
      t.string :room, default: ''

      t.string :facebook, default: ''
      t.string :twitter, default: ''
      t.string :youtube, default: ''
      t.string :instagram, default: ''
      t.string :pinterest, default: ''
      t.string :snapchat, default: ''
      t.string :tumblr, default: ''

      t.boolean :confirmed, default: false
      t.timestamps
    end
  end
end
