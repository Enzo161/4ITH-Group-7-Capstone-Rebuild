class AddDeviseTwoFactorToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :encrypted_otp_secret
    remove_column :users, :encrypted_otp_secret_iv
    remove_column :users, :encrypted_otp_secret_salt
    remove_column :users, :consumed_timestep
    remove_column :users, :otp_required_for_login
    add_column :users, :encrypted_otp_secret, :string
    add_column :users, :encrypted_otp_secret_iv, :string
    add_column :users, :encrypted_otp_secret_salt, :string
    add_column :users, :consumed_timestep, :integer
    add_column :users, :otp_required_for_login, :boolean
  end
end
