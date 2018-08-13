class AddSocialMediaToStuga < ActiveRecord::Migration[5.1]
  def change
    add_column :stugen, :facebook, :string, default: ''
    add_column :stugen, :twitter, :string, default: ''
    add_column :stugen, :youtube, :string, default: ''
    add_column :stugen, :instagram, :string, default: ''
    add_column :stugen, :pinterest, :string, default: ''
    add_column :stugen, :snapchat, :string, default: ''
    add_column :stugen, :tumblr, :string, default: ''
  end
end
