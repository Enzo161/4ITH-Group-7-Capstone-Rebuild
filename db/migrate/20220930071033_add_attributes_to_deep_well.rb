class AddAttributesToDeepWell < ActiveRecord::Migration[6.0]
  def change
    add_column :deep_wells, :dateGranted, :date
    add_column :deep_wells, :clientName, :string
    add_column :deep_wells, :wellLocation, :string
    add_column :deep_wells, :wellCoodinates, :string
    add_column :deep_wells, :waterPermitNo, :string
    add_column :deep_wells, :contractor, :string
    add_column :deep_wells, :depthTotal, :string
    add_column :deep_wells, :dateofUTVI, :date
    add_column :deep_wells, :reason, :text
  end
end
