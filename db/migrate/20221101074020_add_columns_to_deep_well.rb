class AddColumnsToDeepWell < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :dateConstructed, :date
    add_column :deep_wells, :limit, :text
    add_column :deep_wells, :driller_name, :text
    add_column :deep_wells, :remarks, :text
  end
end
