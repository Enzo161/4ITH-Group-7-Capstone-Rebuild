class EditTableAttributes < ActiveRecord::Migration[6.0]
  def change
    rename_column :islands, :name, :island_name
    rename_column :clients, :name, :client_name
    rename_column :deep_wells, :name, :deep_well_name
  end
end
