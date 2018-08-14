class AddConfirmedToStuga < ActiveRecord::Migration[5.1]
  def change
    add_column :stugen, :confirmed, :boolean, default: false
  end
end
