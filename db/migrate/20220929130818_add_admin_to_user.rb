class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :text, default: 'user'
  end
end