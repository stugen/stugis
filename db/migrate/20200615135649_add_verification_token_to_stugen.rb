class AddVerificationTokenToStugen < ActiveRecord::Migration[5.1]
  def change
    add_column :stugen, :verification_token, :string, default: -> {'md5(gen_random_bytes(256))'}
  end
end
