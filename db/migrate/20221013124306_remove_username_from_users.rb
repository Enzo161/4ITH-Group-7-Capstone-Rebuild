class RemoveUsernameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :username
    drop_table :usermanages
  end
end
