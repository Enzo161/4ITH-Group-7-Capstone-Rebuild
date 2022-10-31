class AddDeviseTwoFactorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :encrypted_otp_secret, :text
    add_column :users, :encrypted_otp_secret_iv, :text
    add_column :users, :encrypted_otp_secret_salt, :text
    add_column :users, :consumed_timestep, :integer
    add_column :users, :otp_required_for_login, :boolean
  end
end
