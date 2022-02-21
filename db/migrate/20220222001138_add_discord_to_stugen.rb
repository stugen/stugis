class AddDiscordToStugen < ActiveRecord::Migration[5.3]
  def change
    add_column :stugen, :discord, :string
  end
end
