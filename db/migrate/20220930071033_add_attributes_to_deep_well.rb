class AddAttributesToDeepWell < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :dateGranted, :date
    add_column :deep_wells, :clientName, :text
    add_column :deep_wells, :wellLocation, :text
    add_column :deep_wells, :wellCoodinates, :text
    add_column :deep_wells, :waterPermitNo, :text
    add_column :deep_wells, :contractor, :text
    add_column :deep_wells, :depthTotal, :text
    add_column :deep_wells, :dateofUTVI, :date
    add_column :deep_wells, :reason, :text
  end
end
